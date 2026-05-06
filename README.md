# IMG.LY Editor

The `imgly_editor` plugin contains the prebuilt iOS and Android editors of the _Creative Engine_, the UI for CE.SDK - made accessible for Flutter.
The Creative Engine enables you to build any design editing UI, automation and creative workflow.
It offers performant and robust graphics processing capabilities combining the best of layout, typography and image processing with advanced workflows centered around templating and adaptation.

Visit our [documentation](https://img.ly/docs/cesdk) for more tutorials on how to integrate and customize the engine for your specific use case.

## License

The CreativeEditor SDK is a commercial product. You can purchase a license at https://img.ly/pricing. Alternatively, you can use `null` as the license parameter to run the SDK in evaluation mode with a watermark.

## Getting Started

To get started with IMG.LY Editor for Flutter, please [refer to our documentation](https://img.ly/docs/cesdk/mobile-editor/quickstart?platform=flutter). There you will learn how to integrate and configure them for your use case.

## Integration

```Dart
import 'package:imgly_editor/imgly_editor.dart';

// Configure the editor.
final settings = EditorSettings(license: "YOUR_LICENSE");

// Open the editor and retrieve the result.
final result = await IMGLYEditor.openEditor(settings: settings);
```

## Changelog

To keep up-to-date with the latest changes, visit [CHANGELOG](https://img.ly/docs/cesdk/changelog/).
