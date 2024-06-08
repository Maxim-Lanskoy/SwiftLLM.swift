// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LLM",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .visionOS(.v1),
        .watchOS(.v4),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "LLM",
            targets: ["LLM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ggerganov/llama.cpp/", revision: "7a16ce7db2a74a223f0f3b9cee66d4539c5bce8f"),
        .package(url: "https://github.com/kishikawakatsumi/swift-power-assert", from: "0.12.0"),
    ],
    targets: [
        .target(
            name: "LLM",
            dependencies: [
                .product(name: "llama", package: "llama.cpp")
            ]),
        .testTarget(
            name: "LLMTests",
            dependencies: [
                .product(name: "PowerAssert", package: "swift-power-assert"),
                "LLM"
            ]),
    ]
)
