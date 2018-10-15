# BadasSwift

[![CI Status](https://img.shields.io/travis/MorganBerger/BadasSwift.svg?style=flat&branch=master)](https://travis-ci.org/MorganBerger/BadasSwift)
[![Version](https://img.shields.io/cocoapods/v/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)
[![License](https://img.shields.io/cocoapods/l/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)
[![Platform](https://img.shields.io/cocoapods/p/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)

## Description

A colourful library of Swift extensions & custom stuffs!

[Documentation](#documentation):
1. [Extensions](#extensions)
   - [Bundle](#bundle)
   - [CharacterSet](#characterset)
   - [CLLocationManager](#cllocationmanager)
   - [Date](#date)
   - [NSLayoutConstraint](#nslayoutconstraint)
   - [String](#string)
   - [UIButton](#uibutton)
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

- #### Bundle:<br/>
  Provides rapid access to app version & build numbers.
  ```
  public var versionNumber: String? { get }
  public var buildVersionNumber: String? { get }
  ```
  Usage:
   
  `print("Version number: \(Bundle.main.versionNumber)")`\
  **Output ->** _"Version number: 1.0"_
  
- #### CharacterSet:<br/>
   ```
   static let urlAllowed: CharacterSet
   ```
   The *urlAllowed* variable is a CharacterSet union between:
   - .urlFragmentAllowed
   - .urlHostAllowed
   - .urlPasswordAllowed
   - .urlQueryAllowed
   - .urlUserAllowed
   
   It allows quick conversion from any string to a formatted acceptable url string.
   
   Usage:
   ```
   var urlStr = "http://google.com/search?q=Hello there, have a good day."
   urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlAllowed)!
   ```
   `  print(urlStr)`\
   **Output ->** _"http://google.com/search?q=Hello%20there,%20have%20a%20good%20day."_
  
- #### CLLocationManager:
  ```
  public static var isAuthorized: Bool { get }
  ```
  Returns **true** if user authorized location _always_ or _whenInUse_
  
- #### Date:

  Returns a date string with asked format.
  ```
  public func formatedString(_ format: String) -> String
  ```
  
  `print("Today's date is: \(Date().formatedString("EEEE, MMM d, yyyy"))")`\
  **Output ->** _"Today's date is Monday, Oct 11, 2018"_
  
- #### NSLayoutConstraint:

  Provides some sweet real-time animation methods for NSLayoutConstraint.
  ```
  public func animateConstraintTo(_ value: CGFloat, for view: UIView, duration: Double)
  public func animateConstraintTo(_ value: CGFloat, for view: UIView, duration: Double, completion: @escaping () -> Void)
  
  public func setMultiplier(multiplier: CGFloat) -> NSLayoutConstraint
  ```
  
- #### String:
  
  Got a string full of HTML tags? Change it to a attributed string with the methods below.
  ```
  public var html2AttributedString: NSAttributedString? { get }
  public var html2String: String { get }
  ```
  
  Usage:
  ```
  let htmlStr = "<h1>Very Big Title</h1>"
  let attributedStr = htmlStr.html2AttributedString()
  ```
  
  Or you could smoothly hash any string to MD5 if you feel like it!
  ```
  public func MD5Hex() -> String
  public func MD5base64() -> String
  ```
  
- #### UIButton:
  ```
  func alignTextHorizontal(spacing: CGFloat = default)
  ```
  
- #### UIImage:

  Convert image to black & white (grayscale).
  ```
  public func convertToGrayScale() -> UIImage
  ```
  
  Check is two images are identicals.
  ```
  public func isEqualTo(_ image: UIImage) -> Bool
  ```
  
  Scale any image to the provided CGSize.
  ```
  func scaleImage(scaleToSize: CGSize) -> UIImage
  ```
  
- #### UIImageView:

  Fetches any web image from its url and applies it to the image view. Fast & async!
  ```
  public func setImageWithUrlString(_ urlStr: String, completion: @escaping (_ img: UIImage?) -> Void)
  ```
  
  Usage:
  ```
  anyImageView.setImageWithUrlString("http://something.com/someImage.png") { (img) in
      //the completion block send back the UIImage object that has been fetched.
  }
  ```
  
- #### UIView:

  Get the root view in view hierarchy.
  ```
  public var rootView: UIView { get }
  ```
  \
  Animate any view alpha to **1.0f**. Can be called with or without completion block.
  ```
  public func showWithDuration(_ duration: Double)
  public func showWithDuration(_ duration: Double, completion: @escaping () -> Void)
  ```
  Animate any view alpha to **0.0f**. Can be called with or without completion block.
  ```
  public func hideWithDuration(_ duration: Double)
  public func hideWithDuration(_ duration: Double, completion: @escaping () -> Void)
  ```
  \
  Put 1px width border to any view with the wanted color. Mostly use for debugging purposes.
  ```
  public func putBorders(color: UIColor)
  ```
  \
  Adds a vertical gradient layer with wanted colors to any view.
  ```
  public func putGradient(_ colors: CGColor...)
  ```
  \
  Basically turn a view to an UIImage.
  ```
  public func takeSnapshot() -> UIImage?
  ```
  
- #### UIViewController:
  ```
  public func setStatusBarColor(_ color: UIColor)
  ```
  Easily change the status bar color from any view controller!
  
  Usage:
  ```
  override func viewDidLoad() {
      super.viewDidLoad()
      self.setStatusBarColor(UIColor.blue)
  }
  ```
  
- #### URL:
  ```
  public static func verifyUrl(string: String?) -> Bool
  ```
  Return **_true_** if url is correct/reachable. Else **_false_**.

### Models
- #### SnappingCollectionViewLayout:
  ```
  ```

### Views
- #### VoteView:
  ```
  ```
  
- #### AwesomePageControl:
  ```
  ```

## Author

morganberger, morgan.berger71@gmail.com

## License

BadasSwift is available under the MIT license. See the LICENSE file for more info.
