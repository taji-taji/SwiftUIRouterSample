// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "App",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "App",
            targets: ["App"]),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                "Router",
                "Feature1",
                "Feature2",
                "Feature3",
            ]),
        .target(
            name: "Router"),
        .target(
            name: "Feature1",
            dependencies: [
                "Router",
            ]),
        .target(
            name: "Feature2",
            dependencies: [
                "Router",
            ]),
        .target(
            name: "Feature3",
            dependencies: [
                "Router",
            ]),
    ]
)
