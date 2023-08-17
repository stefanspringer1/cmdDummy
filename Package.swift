// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "cmdDummy",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", Version(1,0,1)...Version(1,0,1)),
        .package(url: "https://github.com/stefanspringer1/SwiftWorkflow", from: "1.2.178"),
        .package(path: "../libDummy"), // need this a a local repository because of unsafe C-flag for Windows in ZIPFoundationModern
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "cmdDummy",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Workflow", package: "SwiftWorkflow"),
                "libDummy",
            ],
            path: "Sources",
            swiftSettings: [
                .enableUpcomingFeature("ConciseMagicFile"),
            ]
        ),
    ]
)
