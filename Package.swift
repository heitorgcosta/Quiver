// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Quiver",
    targets: [
        .target(name: "Quiver", dependencies: [], path: "Quiver"),
        .testTarget(name: "QuiverTests", dependencies: [], path: "QuiverTests")
    ]
)
