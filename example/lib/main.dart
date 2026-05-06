import 'package:flutter/material.dart';
import 'package:imgly_editor/imgly_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                final settings = EditorSettings(
                    license:
                        "YOUR_LICENSE"); // Get your license from https://img.ly/forms/free-trial, pass null for evaluation mode with watermark
                final _ = IMGLYEditor.openEditor(settings: settings);
              },
              child: const Text("Open Editor")),
        ),
      ),
    );
  }
}
