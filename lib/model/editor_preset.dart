/// An editor preset for an existing UI configuration.
enum EditorPreset {
  /// Design editor.
  design,

  /// Photo editor.
  photo,

  /// Postcard editor.
  postcard,

  /// Apparel editor.
  apparel,

  /// Video editor.
  video
}

/// An extension to make the string value accessible.
extension EditorPresetStringValue on EditorPreset {
  /// The string value.
  String get stringValue {
    switch (this) {
      case EditorPreset.design:
        return 'design';
      case EditorPreset.photo:
        return 'photo';
      case EditorPreset.postcard:
        return 'postcard';
      case EditorPreset.apparel:
        return 'apparel';
      case EditorPreset.video:
        return 'video';
    }
  }
}
