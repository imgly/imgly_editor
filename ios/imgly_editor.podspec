#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint imgly_editor.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'imgly_editor'
  s.version          = '1.83.0-rc.2'
  s.summary          = 'CreativeEditor SDK editors for Flutter.'
  s.homepage         = 'https://img.ly'
  s.license          = { file: '../LICENSE' }
  s.author           = { 'IMG.LY GmbH' => 'contact@img.ly' }
  s.source           = { path: '.' }

  s.source_files = 'imgly_editor/Sources/imgly_editor/**/*.swift'
  s.exclude_files = 'imgly_editor/Sources/imgly_editor/StarterKits/**/*StarterKit.swift'
  s.resources = 'imgly_editor/Sources/imgly_editor/StarterKits/*.{scene,png}'

  s.dependency 'Flutter'
  s.dependency 'IMGLYUI', s.version.to_s

  s.platform = :ios, '16.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.10'
end
