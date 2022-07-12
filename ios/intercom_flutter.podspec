#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint intercom_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'intercom_flutter'
  s.version          = '0.0.1'
  s.summary          = 'intercom for analytics'
  s.description      = <<-DESC
intercom for analytics
                       DESC
  s.homepage         = 'hudle.in'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Syed' => 'syed@hudle.in' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Intercom'
  s.static_framework = true
  s.platform = :ios, '9.0'


#   # Flutter.framework does not contain a i386 slice.
#   s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
#   s.swift_version = '5.0'
end
