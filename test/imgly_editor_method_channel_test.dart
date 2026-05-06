import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imgly_editor/imgly_editor_method_channel.dart';
import 'package:imgly_editor/model/editor_preset.dart';
import 'package:imgly_editor/model/editor_settings.dart';
import 'package:imgly_editor/model/source.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelIMGLYEditor platform = MethodChannelIMGLYEditor();
  const MethodChannel channel = MethodChannel('imgly_editor');

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('openEditor', () async {
    final source = Source.fromImage("IMAGE_SOURCE");
    const preset = EditorPreset.photo;
    final settings = EditorSettings(license: "MY_LICENSE");
    final metadata = {"custom": true};

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        expect(methodCall.method, "openEditor");
        expect(methodCall.arguments, {
          "preset": preset.stringValue,
          "settings": {"source": source.toJson(), ...settings.toJson()},
          "metadata": metadata
        });
        return {
          "scene": "MY_SCENE",
          "artifact": "MY_ARTIFACT",
          "thumbnail": "MY_THUMBNAIL",
          "metadata": {"key": "value"}
        };
      },
    );

    final result = await platform.openEditor(
        source: source, preset: preset, settings: settings, metadata: metadata);

    expect(result, isNotNull);
    expect(result?.scene, "MY_SCENE");
    expect(result?.artifact, "MY_ARTIFACT");
    expect(result?.thumbnail, "MY_THUMBNAIL");
    expect(result?.metadata, {"key": "value"});
  });
}
