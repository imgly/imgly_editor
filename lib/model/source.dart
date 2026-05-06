/// A source for the editor.
class Source {
  /// The source.
  final String source;

  /// The type of source.
  final String _type;

  /// Creates a new source from an image.
  /// The [source] should be pointing to a valid image file.
  Source.fromImage(this.source) : _type = "image";

  /// Creates a new source from a video.
  /// The [source] should be pointing to a valid video file.
  Source.fromVideo(this.source) : _type = "video";

  /// Creates a new source from a scene.
  /// The [source] should be pointing to a valid scene file.
  Source.fromScene(this.source) : _type = "scene";

  /// Converts the instance to a `Map<String, dynamic>`
  /// for JSON encoding.
  Map<String, dynamic> toJson() => {"source": source, "type": _type};
}
