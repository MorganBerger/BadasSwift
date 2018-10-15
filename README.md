# BadasSwift

[![CI Status](https://img.shields.io/travis/MorganBerger/BadasSwift.svg?style=flat&branch=master)](https://travis-ci.org/MorganBerger/BadasSwift)
[![Version](https://img.shields.io/cocoapods/v/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)
[![License](https://img.shields.io/cocoapods/l/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)
[![Platform](https://img.shields.io/cocoapods/p/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)

## Description

A colourful library of Swift extensions & custom stuffs!

Documentation:
1. [Extensions](#extensions)
   - [Bundle](#bundle)
   - [CharacterSet](#characterset)
   - [CLLocationManager](#cllocationmanager)
   - [Date](#date)
   - [NSLayoutConstraint](#nslayoutconstraint)
   - [String](#string)
   - [UIButton](#uibutton)
   - [UIDevice](#uidevice)
   - [UIImage](#uiimage)
   - [UIImageView](#uiimageview)
   - [UIView](#uiview)
   - [UIViewController](#uiviewcontroller)
   - [URL](#url)
2. [Models](#models)
   - [SnappingCollectionViewLayout](#snappingcollectionviewlayout)
3. [Views](#views)
   - [VoteView](#voteview)
   - [AwesomePageControl](#awesomepagecontrol)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 9.3+
- Xcode 9.4+
- Swift 4.0+

## Installation

BadasSwift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BadasSwift'
```

## Documentation

### Extensions

- #### Bundle
  ```
  public var versionNumber: String? { get }
  public var buildVersionNumber: String? { get }
  ```
- #### CharacterSet
  ```
  internal static let urlAllowed: CharacterSet
  ```
- #### CLLocationManager
  ```
  public static var isAuthorized: Bool { get }
  ```
- #### Date
  ```
  public func formatedString(_ format: String) -> String
  ```
- #### NSLayoutConstraint
  ```
  public func animateConstraintTo(_ value: CGFloat, for view: UIView, duration: Double)
  public func animateConstraintTo(_ value: CGFloat, for view: UIView, duration: Double, completion: @escaping () -> Void)
  public func setMultiplier(multiplier: CGFloat) -> NSLayoutConstraint
  ```
- #### String
  ```
  public var html2AttributedString: NSAttributedString? { get }
  public var html2String: String { get }
  public func MD5Data() -> Data
  public func MD5Hex() -> String
  public func MD5base64() -> String
  ```
- #### UIButton
  ```
  internal func alignTextHorizontal(spacing: CGFloat = default)
  ```
- #### UIDevice
  ```
  public var modelName: String { get }
  ```
- #### UIImage
  ```
  public func convertToGrayScale() -> UIImage
  internal func scaleImage(scaleToSize: CGSize) -> UIImage
  public func isEqualTo(_ image: UIImage) -> Bool
  public class func getImageWithURL(_ url: URL, completion: @escaping (_ img: UIImage?) -> Void)
  ```
- #### UIImageView
  ```
  public func setImageWithUrlString(_ urlStr: String, completion: @escaping (_ img: UIImage?) -> Void)
  ```
- #### UIView:
  ```
  public func removeAllSubviews()
  public func showWithDuration(_ duration: Double)
  public func hideWithDuration(_ duration: Double)
  public func showWithDuration(_ duration: Double, completion: @escaping () -> Void)
  public func hideWithDuration(_ duration: Double, completion: @escaping () -> Void)
  ```
- #### UIViewController
  ```
  public func setStatusBarColor(_ color: UIColor)
  ```
- #### URL
  ```
  public static func verifyUrl(string: String?) -> Bool
  ```

### Models
- #### SnappingCollectionViewLayout
  ```
  ```

### Views
- #### VoteView
  ```
  ```
- #### AwesomePageControl
  ```
  ```

## Author

morganberger, morgan.berger71@gmail.com

## License

BadasSwift is available under the MIT license. See the LICENSE file for more info.
