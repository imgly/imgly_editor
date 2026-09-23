/// The [EditorSettings] are used to provide the
/// information needed by the editor to operate.
class EditorSettings {
  /// The license of the editor. Pass `null` to run the SDK in evaluation mode with a watermark.
  final String? license;

  /// The base URI used by the engine for built-in assets like emoji and
  /// fallback fonts, and by the editor for its default and demo asset
  /// sources (stickers, filters, and more).
  ///
  /// By default, assets are loaded from the IMG.LY CDN at
  /// `https://cdn.img.ly/packages/imgly/cesdk-flutter/<version>/assets`.
  /// For production use, we recommend downloading the assets from
  /// `https://cdn.img.ly/packages/imgly/cesdk-flutter/<version>/imgly-assets.zip`,
  /// hosting them on your own server, and setting `baseUri` to your
  /// hosted location.
  final String baseUri;

  /// Unique ID tied to your application's user. This helps
  /// us accurately calculate monthly active users (MAU).
  final String? userId;

  /// Creates new [EditorSettings] from the given
  /// properties.
  ///
  /// The [license] is used to unlock the editor. Pass `null` to run the SDK in evaluation mode with a watermark.
  /// The [baseUri] specifies where engine assets (emoji, fallback fonts)
  /// and editor asset sources are loaded from. Defaults to the IMG.LY CDN.
  /// The [userId] is the ID of the user that is associated with this
  /// instance.
  EditorSettings(
      {this.license,
      this.baseUri =
          "https://cdn.img.ly/packages/imgly/cesdk-flutter/1.83.0-rc.1/assets",
      this.userId});

  /// Converts the instance to a `Map<String, dynamic>`
  /// for JSON encoding.
  Map<String, dynamic> toJson() => {
        "license": license,
        "baseUri": baseUri,
        "userId": userId
      };
}
