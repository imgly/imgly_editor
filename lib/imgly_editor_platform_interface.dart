import 'package:imgly_editor/imgly_editor_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'model/editor_preset.dart';
import 'model/editor_result.dart';
import 'model/editor_settings.dart';
import 'model/source.dart';

export 'model/editor_preset.dart';
export 'model/editor_result.dart';
export 'model/editor_settings.dart';
export 'model/source.dart';

abstract class IMGLYEditorPlatform extends PlatformInterface {
  /// Constructs a ImglyEditorPlatform.
  IMGLYEditorPlatform() : super(token: _token);

  static final Object _token = Object();

  static IMGLYEditorPlatform _instance = MethodChannelIMGLYEditor();

  /// The default instance of [IMGLYEditorPlatform] to use.
  ///
  /// Defaults to [MethodChannelIMGLYEditor].
  static IMGLYEditorPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IMGLYEditorPlatform] when
  /// they register themselves.
  static set instance(IMGLYEditorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Opens the creative editor.
  ///
  /// The editor will be opened with the given [source]
  /// or the default asset if `null`. If desired, the editor
  /// can be opened from a given UI [preset] which is
  /// `EditorPreset.design` by default.
  /// The [settings] includes all the properties needed
  /// for the editor to work, e.g. the license and the CDN for
  /// assets. Optionally, [metadata] can also be specified
  /// which is not used by the plugin other than with a custom
  /// implementation.
  Future<EditorResult?> openEditor(
      {Source? source,
      EditorPreset? preset = EditorPreset.design,
      required EditorSettings settings,
      Map<String, dynamic>? metadata}) {
    throw UnimplementedError('openEditor() has not been implemented.');
  }
}
