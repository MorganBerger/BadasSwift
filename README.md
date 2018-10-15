# BadasSwift

[![CI Status](https://img.shields.io/travis/MorganBerger/BadasSwift.svg?style=flat&branch=master)](https://travis-ci.org/MorganBerger/BadasSwift)
[![Version](https://img.shields.io/cocoapods/v/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)
[![License](https://img.shields.io/cocoapods/l/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)
[![Platform](https://img.shields.io/cocoapods/p/BadasSwift.svg?style=flat)](https://cocoapods.org/pods/BadasSwift)

## Description

A colourful library of Swift extensions & custom stuffs!

Documentation:
- [Extensions](#extensions)
  - [UIView](#uiview)
- Models
  - SnappingCollectionViewFlowLayout
- Views
  - VoteView
  - AwesomePageControl


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

- #### UIView:
```
public func removeAllSubviews()
public func showWithDuration(_ duration: Double)
public func hideWithDuration(_ duration: Double)
public func showWithDuration(_ duration: Double, completion: @escaping () -> Void)
public func hideWithDuration(_ duration: Double, completion: @escaping () -> Void)
```

## Author

morganberger, morgan.berger71@gmail.com

## License

BadasSwift is available under the MIT license. See the LICENSE file for more info.
