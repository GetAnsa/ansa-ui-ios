// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "AnsaUI",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "AnsaUI", targets: ["AnsaUIWrapper"]),
    ],
    dependencies: [
       .package(url: "https://github.com/GetAnsa/ansa-core-ios", from: "0.1.5"),
       .package(url: "https://github.com/Basis-Theory/basistheory-ios", from: "4.1.2")
    ],
    targets: [
        .binaryTarget(
            name: "AnsaUI",
            path: "AnsaUI.xcframework"
        ),

        .target(
            name: "AnsaUIWrapper",
            dependencies: [
                 .product(name: "AnsaCore", package: "ansa-core-ios"),
                 "AnsaUI",
                 .product(name: "BasisTheoryElements", package: "basistheory-ios"),
            ],
            path: "./Sources"
        ),
    ]
)
