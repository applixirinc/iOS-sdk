#
# Be sure to run `pod lib lint AppLixirAds.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppLixirAds'
  s.version          = '0.1.0'
  s.summary          = 'Wrapper for playing an ad with WebView for iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Wrapper for playing an ad with WebView for iOS. It provides a simple interface to integrate ads into your iOS applications, allowing developers to easily display advertisements using a web view.
                       DESC

  s.homepage         = 'https://github.com/applixirinc/iOS-sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AppLixir' => 'info@applixir.com' }
  s.source           = { :git => 'https://github.com/applixirinc/iOS-sdk.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  #s.resources = 'AppLixirAds/Assets/**/*'
  
  s.source_files = 'Classes/**/*.{swift}'

  s.swift_versions = '5.0'

  s.resource_bundles = {
    'AppLixirAds' => ['Assets/**/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
