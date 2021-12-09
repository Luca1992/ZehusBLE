#
# Be sure to run `pod lib lint MyBike_BLE.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MyBike_BLE'
  s.version          = '1.0.0'
  s.summary          = 'A short description of MyBike_BLE.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Luca1992/ZehusBLE'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Luca1992' => 'lucadonetti@libero.it' }
  s.source           = { :git => 'https://github.com/Luca1992/ZehusBLE.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.1'

  s.source_files = 'MyBike_BLE/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MyBike_BLE' => ['MyBike_BLE/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'Bluejay', '~> 0.8'
  s.dependency 'XCGLogger', '~> 6.1.0'
  s.dependency 'PromiseKit', '~> 6.8.3'
  s.dependency 'ZIPFoundation', '~> 0.9.9'
end
