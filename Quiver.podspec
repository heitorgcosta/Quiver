#
# Be sure to run `pod lib lint SharediOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Quiver'
  s.version          = '1.2.0'
  s.summary          = 'Validation, searching and filtering made easy for swift.'

  s.homepage         = 'https://github.com/heitorgcosta/Quiver'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HeyThor' => 'heitorgcosta1993@gmail.com' }
  s.source           = { :git => 'https://github.com/heitorgcosta/Quiver.git', :tag => s.version }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Quiver/**/*.{swift,h}'
  s.public_header_files = 'Quiver/Quiver.h'
end
