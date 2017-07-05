![](https://raw.githubusercontent.com/konojunya/ImageFit/master/assets/imageFit-logo.png)

[![CocoaPods](https://img.shields.io/cocoapods/v/ImageFit.svg?style=flat)]()
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![platform](https://img.shields.io/badge/platform-ios-lightgray.svg)]()
[![swift version](https://img.shields.io/badge/in-swift%203.0-orange.svg)]()
[![CocoaPods](https://img.shields.io/cocoapods/l/AFNetworking.svg)]()
[![Twitter](https://img.shields.io/badge/twitter-@konojunya-blue.svg)]()

ImageFit is a library that optimize UIImage according to vertical and horizontal size.

## Description

Draw UIImage in the center while keeping aspect ratio of aspect ratio.

## DEMO

![](https://raw.githubusercontent.com/konojunya/ImageFit/master/screenshots/demo.png)

## Usage

```swift
import ImageFit

ImageFit.drawInImage(image: <UIImage>, imageView: <UIImageView>)
ImageFit.drawInImage(image: <UIImage>, width: <CGFloat>, height: <CGFloat>)
```

**sample code**

```swift
import ImageFit

class ViewController: UIViewController {
	
	@IBOutlet weak var imageView:UIImageView!
	
	override func viewDidLoad(){
		super.viewDidLoad()
		
		let image = UIImage(named: "sample")
		self.imageView.image = ImageFit.drawInImage(image: image,imageView: self.imageView)
		
	}
	
}
```

## Installation

### CococaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Cocoa projects. You can install it with the following command:

```
$ gem install cocoapods
```

To integrate Alamofire into your Xcode project using CocoaPods, specify it in your `Podfile`:

```
source 'https:/github.com/CocoaPods/Spec.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
	pod 'ImageFit', '~> 1.1.0'
end
```

Then, run the following command:

```
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage/) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](https://brew.sh) using the following command:

```
$ brew update
$ brew install carthage
```

To integrate Alamofire into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github "konojunya/ImageFit" ~> 1.1.0
```

Run `carthage update` to build the framework and drag the built Alamofire.framework into your Xcode project.

## LICENSE

ImageFit is released under the MIT license. [See LICENCE](https://github.com/konojunya/ImageFit/blob/master/LICENSE) for details.

## Author

I'm a student at HAL Osaka.
