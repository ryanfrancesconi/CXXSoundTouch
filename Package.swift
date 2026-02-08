// swift-tools-version: 6.2
// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi

import PackageDescription

let package = Package(
    name: "CXXSoundTouch",
    defaultLocalization: "en",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "SoundTouch",
            targets: [
                "SoundTouch"
            ]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SoundTouch",
            cxxSettings: [
                .headerSearchPath("include")
            ])
    ],
    cxxLanguageStandard: .cxx20
)
