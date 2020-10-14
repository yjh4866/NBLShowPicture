#
# Be sure to run `pod lib lint NBLShowPicture.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NBLShowPicture'
  s.version          = '0.3.2'
  s.summary          = '全屏查看若干张图片。Show picture in full screen.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
全屏查看若干张图片，支持UIImage和图片url。Show picture in full screen.
                       DESC

  s.homepage         = 'https://github.com/yjh4866/NBLShowPicture'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '杨建红' => 'yjh4866@163.com' }
  s.source           = { :git => 'https://github.com/yjh4866/NBLShowPicture.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'NBLShowPicture/Classes/**/*'
  
  s.resource_bundles = {
    'NBLShowPicture' => ['NBLShowPicture/Assets/*.{xib,storyboard}']
  }

  s.public_header_files = 'NBLShowPicture/Classes/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SDWebImage'
end
