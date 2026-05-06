import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'imgly_editor_platform_interface.dart';

/// An implementation of [IMGLYEditorPlatform] that uses method channels.
class MethodChannelIMGLYEditor extends IMGLYEditorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('imgly_editor');

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
  @override
  Future<EditorResult?> openEditor(
      {Source? source,
      EditorPreset? preset = EditorPreset.design,
      required EditorSettings settings,
      Map<String, dynamic>? metadata}) async {
    final result = await methodChannel.invokeMethod("openEditor", {
      "preset": preset?.stringValue,
      "settings": {"source": source?.toJson(), ...settings.toJson()},
      "metadata": metadata
    });
    return result == null
        ? null
        : EditorResult.fromJson(Map<String, dynamic>.from(result));
  }
}
