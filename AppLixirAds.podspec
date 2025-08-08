Pod::Spec.new do |s|
  s.name             = 'AppLixirAds'
  s.version          = '0.4.0'
  s.summary          = 'Wrapper for playing an ad with WebView for iOS.'

  s.description      = <<-DESC
    AppLixirAds is a lightweight iOS library that provides a simple wrapper to display ads using a WebView.
    It is designed for easy integration and customization to show ads inside your iOS app.
  DESC

  s.homepage         = 'https://github.com/applixirinc/iOS-SDK'
  s.license          = { type: 'Apache 2.0', file: 'LICENSE' }
  s.author           = { 'AppLixir' => 'info@applixir.com' }
  s.source           = { git: 'https://github.com/applixirinc/iOS-SDK.git', tag: s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.swift_versions = ['5.0']


  # Source files: your swift files are inside AppLixirAds/Classes
  s.source_files = 'AppLixirAds/Classes/**/*.{swift}'

  # Resource bundle for assets inside AppLixirAds/Assets
  s.resource_bundles = {
    'AppLixirAds' => ['AppLixirAds/Assets/**/*']
  }

  # Frameworks you depend on (e.g., UIKit for iOS UI components)
  s.frameworks = 'UIKit'

  # Uncomment and add any dependencies if you have
  # s.dependency 'SomeLibrary', '~> 1.0'
end
