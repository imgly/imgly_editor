import 'imgly_editor_platform_interface.dart';

export 'package:imgly_editor/model/editor_preset.dart';
export 'package:imgly_editor/model/editor_result.dart';
export 'package:imgly_editor/model/editor_settings.dart';
export 'package:imgly_editor/model/source.dart';

class IMGLYEditor {
  /// Opens the creative editor.
  ///
  /// The editor will be opened with the given [source]
  /// or the default asset if `null`. If desired, the editor
  /// can be opened from a given UI [preset] which is
  /// `EditorPreset.design` by default.
  /// The [settings] include all the properties needed
  /// for the editor to work, e.g. the license and the CDN for
  /// assets. Optionally, [metadata] can also be specified
  /// which is not used by the plugin other than with a custom
  /// implementation.
  static Future<EditorResult?> openEditor(
      {Source? source,
      EditorPreset? preset = EditorPreset.design,
      required EditorSettings settings,
      Map<String, dynamic>? metadata}) {
    return IMGLYEditorPlatform.instance.openEditor(
        source: source, preset: preset, settings: settings, metadata: metadata);
  }
}
