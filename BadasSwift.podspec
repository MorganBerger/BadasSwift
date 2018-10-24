#
# Be sure to run `pod lib lint BadasSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BadasSwift'
  s.version          = '0.1.4'
  s.summary          = 'A colourful library of Swift base classes extensions & customed stuff!'
  s.swift_version    = '4.2'
  
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A colourful library of Swift base classes extensions & customed stuff!
  -> Currently a work in progress. Lot of cleaning to do here!
                       DESC

  s.homepage         = 'https://github.com/morganberger/BadasSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'morganberger' => 'morgan.berger71@gmail.com' }
  s.source           = { :git => 'https://github.com/morganberger/BadasSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  
  s.ios.deployment_target = '9.3'

  s.source_files = 'BadasSwift/Classes/**/*.{h,m,swift}'
  
  s.resources = ['BadasSwift/Classes/**/*.xib', 'BadasSwift/Assets/assets.xcassets']
  
  s.subspec 'Resources' do |resources|
      resources.resource_bundles = {
          'BadasSwift' => ['BadasSwift/Assets/**/*.{png}', 'BadasSwift/Classes/**/*.xib']
      }
  end
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
