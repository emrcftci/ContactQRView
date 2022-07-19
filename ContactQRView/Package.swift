// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContactQRView",
    platforms: [
      .iOS(.v11)
    ],
    products: [
        .library(
            name: "ContactQRView",
            targets: ["ContactQRView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ContactQRView",
            dependencies: [],
            path: "Sources"),
    ]
)
