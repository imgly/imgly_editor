// swift-tools-version: 6.1
// 6.1 is the parse floor for the trailing-comma syntax SwiftFormat enforces (SE-0439). The
// toolchain floor comes from the IMGLYUI-swift dependency (tools 6.3.1) — do not lower this.
import PackageDescription

// The StarterKits directory holds tooling-provided sources and resources; do not
// hand-edit it. Its entry files are excluded from the target below because they
// reference app-side symbols that do not exist in the plugin.
let package = Package(
  name: "imgly_editor",
  platforms: [
    .iOS("16.0"),
  ],
  products: [
    .library(name: "imgly-editor", targets: ["imgly_editor"]),
  ],
  dependencies: [
    // Pinned exactly: the plugin and IMGLYUI are versioned in lockstep, matching the podspec.
    .package(url: "https://github.com/imgly/IMGLYUI-swift.git", exact: "1.82.1"),
  ],
  targets: [
    .target(
      name: "imgly_editor",
      dependencies: [
        // The umbrella product is the only product that vends the IMGLYEditor module.
        .product(name: "IMGLYUI", package: "IMGLYUI-swift"),
      ],
      exclude: [
        "StarterKits/Apparel/ApparelEditorStarterKit.swift",
        "StarterKits/Design/DesignEditorStarterKit.swift",
        "StarterKits/Photo/PhotoEditorStarterKit.swift",
        "StarterKits/Postcard/PostcardEditorStarterKit.swift",
        "StarterKits/Video/VideoEditorStarterKit.swift",
      ],
      resources: [
        .copy("StarterKits/apparel-ui-b-empty.scene"),
        .copy("StarterKits/design-ui-empty.scene"),
        .copy("StarterKits/photo-ui-empty.png"),
        .copy("StarterKits/postcard-empty.scene"),
        .copy("StarterKits/video-empty.scene"),
      ],
    ),
  ],
  // The plugin sources are written for the Swift 5 language mode (see swift_version in the podspec).
  swiftLanguageModes: [.v5],
)
