#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint imgly_editor.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'imgly_editor'
  s.version          = '1.81.0-rc.0'
  s.summary          = 'CreativeEditor SDK editors for Flutter.'
  s.homepage         = 'https://img.ly'
  s.license          = { file: '../LICENSE' }
  s.author           = { 'IMG.LY GmbH' => 'contact@img.ly' }
  s.source           = { path: '.' }

  s.source_files = 'Classes/**/*', 'StarterKits/**/*.swift'
  s.exclude_files = 'StarterKits/**/*StarterKit.swift'
  s.resources = 'StarterKits/*.{scene,png}'

  s.dependency 'Flutter'
  s.dependency 'IMGLYUI', s.version.to_s

  s.platform = :ios, '16.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.10'
end
