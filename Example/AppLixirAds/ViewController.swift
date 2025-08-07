//
//  ViewController.swift
//  AppLixirAds
//
//  Created by AppLixir on 07/29/2025.
//  Copyright (c) 2025 AppLixir. All rights reserved.
//

import UIKit
import AppLixirAds
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let adPlayer = AppLixirAdPlayer()
        adPlayer.setApiKey("ebeaed1d-7178-4442-9a3c-ee99386924c3")
        adPlayer.playAd(from: self) {
            print("✅ Ad finished.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

