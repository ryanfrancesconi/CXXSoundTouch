// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CXXSoundTouch",
    products: [
        .library(
            name: "SoundTouch",
            targets: [
                "SoundTouch",
                "SoundTouchC",
            ]
        )
    ],
    targets: [
        .target(
            name: "SoundTouch",
            cxxSettings: [
                .headerSearchPath("include")
            ]),

        .target(
            name: "SoundTouchC",
            dependencies: [
                .target(name: "SoundTouch")
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("include_private"),
            ],
            cxxSettings: [
                .headerSearchPath("include"),
                .headerSearchPath("include_private"),
            ]
        ),

        .testTarget(
            name: "CXXSoundTouchTests",
            dependencies: [
                "SoundTouchC"
            ]),
    ],
    cxxLanguageStandard: .cxx20
)
