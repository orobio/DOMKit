// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "DOMKit",
    products: [
        .library(
            name: "DOMKit",
            targets: ["DOMKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftwasm/JavaScriptKit.git", from: "0.11.1"),
    ],
    targets: [
        .target(
            name: "DOMKit",
            dependencies: [
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "JavaScriptEventLoop", package: "JavaScriptKit"),
            ]
        ),
    ]
)
