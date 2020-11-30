#
#  Be sure to run `pod spec lint JLToolsFramework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "JLToolsFramework"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of JLToolsFramework."

  spec.description  = <<-DESC
  描述一下
                   DESC

  spec.homepage     = "https://github.com/Dreamoc/JLToolsFramework"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "fengjinlin" => "461775260@qq.com" }
  spec.source       = { :git => "https://github.com/Dreamoc/JLToolsFramework.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"
end
