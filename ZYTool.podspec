#
# Be sure to run `pod lib lint ZYTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZYTool'
  s.version          = '0.1.3'
  s.summary          = 'ZYTool Development Framework Language: Objective-C.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'ZYTool Encapsulates some of the commonly used methods of development, easy to develop and use.'

  s.homepage         = 'https://github.com/zengyuios/ZYTool#zytool-framework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zengyuios' => '958255130@qq.com' }
  s.source           = { :git => 'https://github.com/zengyuios/ZYTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ZYTool/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZYTool' => ['ZYTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'QuartzCore', 'CoreGraphics'
  # s.dependency 'AFNetworking', '~> 2.3'
end
