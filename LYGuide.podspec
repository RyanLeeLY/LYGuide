#
#  Be sure to run `pod spec lint LYGuide.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "LYGuide"
  s.version      = "0.0.1"
  s.summary      = "iOS app guide"
  s.description  = <<-DESC
    Easy guide for iOS app
                   DESC
  s.homepage     = "https://github.com/RyanLeeLY/LYGuide"
  s.license      = "MIT"
  s.author             = { "Yao Li" => "liyao1021@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/RyanLeeLY/LYGuide.git", :tag => "#{s.version}" }
  s.source_files  = "LYGuide", "LYGuide/*.{h,m}"
  s.framework  = "UIKit"
  s.requires_arc = true
end
