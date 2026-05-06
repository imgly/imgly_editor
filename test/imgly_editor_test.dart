import 'package:flutter_test/flutter_test.dart';
import 'package:imgly_editor/imgly_editor.dart';
import 'package:imgly_editor/imgly_editor_method_channel.dart';
import 'package:imgly_editor/imgly_editor_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIMGLYEditorPlatform
    with MockPlatformInterfaceMixin
    implements IMGLYEditorPlatform {
  @override
  Future<EditorResult?> openEditor(
      {Source? source,
      EditorPreset? preset = EditorPreset.design,
      required EditorSettings settings,
      Map<String, dynamic>? metadata}) async {
    return EditorResult(
        scene: "MY_SCENE",
        artifact: "MY_ARTIFACT",
        thumbnail: "MY_THUMBNAIL",
        metadata: {});
  }
}

void main() {
  final IMGLYEditorPlatform initialPlatform = IMGLYEditorPlatform.instance;

  test('$MethodChannelIMGLYEditor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIMGLYEditor>());
  });

  test('openEditor', () async {
    MockIMGLYEditorPlatform fakePlatform = MockIMGLYEditorPlatform();
    IMGLYEditorPlatform.instance = fakePlatform;

    final settings = EditorSettings(license: "NO_LICENSE");
    final result = await IMGLYEditor.openEditor(settings: settings);

    expect(result, isNotNull);
    expect(result?.artifact, "MY_ARTIFACT");
    expect(result?.thumbnail, "MY_THUMBNAIL");
    expect(result?.scene, "MY_SCENE");
    expect(result?.metadata, {});
  });

  group("EditorResult Parsing", () {
    test('EditorResult Parsing - Full', () {
      const resultMock = {
        "scene": "MY_SCENE",
        "artifact": "MY_ARTIFACT",
        "thumbnail": "MY_THUMBNAIL",
        "metadata": {}
      };

      final result = EditorResult.fromJson(resultMock);
      expect(result, isNotNull);
      expect(result.scene, resultMock["scene"]);
      expect(result.artifact, resultMock["artifact"]);
      expect(result.thumbnail, resultMock["thumbnail"]);
      expect(result.metadata, resultMock["metadata"]);
    });

    test('EditorResult Parsing - Null', () {
      const resultMock = {
        "scene": null,
        "artifact": null,
        "thumbnail": null,
        "metadata": null
      };

      final result = EditorResult.fromJson(resultMock);
      expect(result, isNotNull);
      expect(result.scene, null);
      expect(result.artifact, null);
      expect(result.thumbnail, null);
      expect(result.metadata, {});
    });

    test('EditorResult Parsing - Empty', () {
      const Map<String, dynamic> resultMock = {};

      final result = EditorResult.fromJson(resultMock);
      expect(result, isNotNull);
      expect(result.scene, null);
      expect(result.artifact, null);
      expect(result.thumbnail, null);
      expect(result.metadata, {});
    });
  });
}
