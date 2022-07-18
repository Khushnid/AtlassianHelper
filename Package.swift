// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AtlassianHelper",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12)
    ],
    products: [
       .library(
            name: "AtlassianHelper",
            targets: ["AtlassianHelper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0"))
    ],
    targets: [
        .target(
            name: "AtlassianHelper",
            dependencies: [
                .product(name: "Moya", package: "moya")
            ]),
        .testTarget(
            name: "AtlassianHelperTests",
            dependencies: ["AtlassianHelper"]),
    ]
)
