// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "App",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "App",
            targets: ["App"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax", from: "509.0.0"),
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
            name: "Router",
            dependencies: [
                "NavigatableMacros",
            ]),
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
        
        // MARK: - Macros
        
        .macro(
            name: "NavigatableMacros",
            dependencies: [
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax")
            ]),
    ]
)
