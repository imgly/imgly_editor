#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint imgly_editor.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'imgly_editor'
  s.version          = '1.76.1'
  s.summary          = 'CreativeEditor SDK editors for Flutter.'
  s.homepage         = 'https://img.ly'
  s.license          = { file: '../LICENSE' }
  s.author           = { 'IMG.LY GmbH' => 'contact@img.ly' }
  s.source           = { path: '.' }

  # In the monorepo, copy starter kit sources from the shared location.
  # Walk up from __dir__ to find the monorepo root (.ubq-version marker),
  # matching the Android approach in starter-kits-local.gradle.
  ubq_root = nil
  current_dir = File.expand_path(__dir__)
  while current_dir != '/'
    if File.exist?(File.join(current_dir, '.ubq-version'))
      ubq_root = current_dir
      break
    end
    current_dir = File.dirname(current_dir)
  end

  if ubq_root
    copy_script = File.join(ubq_root, 'apps', 'cesdk_swift_examples',
                            'starter-kits', 'copy_starter_kits_source_files.sh')
    if File.executable?(copy_script)
      system('bash', copy_script, File.join(__dir__, 'StarterKits'))
    end
  end

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
