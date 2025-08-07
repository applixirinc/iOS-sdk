import UIKit
import WebKit

public class AppLixirAdPlayer: NSObject {
    private var apiKey: String?
    private var webView: WKWebView?
    private var containerView: UIView?
    private var onAdComplete: (() -> Void)?

    public override init() {
        super.init()
    }

    public func setApiKey(_ key: String) {
        self.apiKey = key
    }

    public func playAd(from viewController: UIViewController, onComplete: (() -> Void)? = nil) {
        guard self.apiKey != nil else {
            print("AppLixirAdPlayer: API Key not set. Call setApiKey() first.")
            return
        }

        self.onAdComplete = onComplete

        let container = UIView(frame: viewController.view.bounds)
        container.backgroundColor = .black
        container.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        let contentController = WKUserContentController()
        contentController.add(self, name: "consoleLogger")

        // Inject logger and adCompleted hook
        let js = """
        (function() {
            const oldLog = console.log;
            console.log = function(...args) {
                window.webkit.messageHandlers.consoleLogger.postMessage(args.join(' '));
                oldLog.apply(console, args);
            };

            window.adCompleted = function() {
                console.log("adCompleted called");
                window.webkit.messageHandlers.consoleLogger.postMessage("Ad event: allAdsCompleted");
            };
        })();
        """
        let userScript = WKUserScript(source: js, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        contentController.addUserScript(userScript)

        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.preferences.javaScriptEnabled = true
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let webView = WKWebView(frame: container.bounds, configuration: config)
        webView.navigationDelegate = self
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.backgroundColor = .black
        webView.isOpaque = false

        container.addSubview(webView)
        viewController.view.addSubview(container)

        self.webView = webView
        self.containerView = container

        // Load local index.html
        if let url = Bundle(for: type(of: self)).url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        } else {
            print("❌ AppLixirAdPlayer: index.html not found in bundle.")
        }
    }

    public func dismissAd() {
        containerView?.removeFromSuperview()
        webView?.navigationDelegate = nil
        webView = nil
        containerView = nil
    }
}

extension AppLixirAdPlayer: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let apiKey = apiKey else { return }

        // Inject apiKey and trigger startAd()
        let js = "window.swiftInjectedKey = '\(apiKey)';"
        webView.customUserAgent =
        "Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) " +
        "AppleWebKit/605.1.15 (KHTML, like Gecko) " +
        "Version/16.0 Mobile/15E148 Safari/604.1"
        webView.evaluateJavaScript(js) { result, error in
            if let error = error {
                print("JS inject error:", error.localizedDescription)
            }
        }
    }
}

extension AppLixirAdPlayer: WKScriptMessageHandler {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard message.name == "consoleLogger" else { return }

        if let msg = message.body as? String {
            print("JS Log:", msg)
            if msg == "Ad event: allAdsCompleted" {
                onAdComplete?()
                dismissAd()
            }
        }
    }
}
