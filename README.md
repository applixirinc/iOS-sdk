# AppLixirAdsPackage



## Getting started


```
cd existing_repo
git remote add origin https://github.com/applixirinc/iOS-sdk
git branch -M main
git push -uf origin main
```


## Name
AppLixirAds

## Description
AppLixirAds wrapper that allows you to open up a WebView that runs AppLixir ad after providing it with your API key.


## Installation
pod "AppLixirAds"

## Usage
Initialize with:
```
let adPlayer = AppLixirAdPlayer()
```
Set your App Lixir API key with 
```
adPlayer.setApiKey("Your API key")
```
Then you can run ad with:
```
adPlayer.playAd(from: self)
```
self must be a UIViewController, as it is required to present the ad using WKWebView.

## License
This project is licensed under the Apache License. See the LICENSE file for details.

