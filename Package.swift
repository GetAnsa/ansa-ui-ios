// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "AnsaUI",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "AnsaUI", targets: ["AnsaUIWrapper"]),
    ],
    dependencies: [
       .package(url: "https://github.com/Basis-Theory/basistheory-ios", from: "4.1.2")
    ],
    targets: [
        .binaryTarget(
            name: "AnsaUI",
            path: "AnsaUI.xcframework"
        ),

        .binaryTarget(
            name: "AnsaCore",
            path: "../AnsaCore/AnsaCore.xcframework"
        ),

        .target(
            name: "AnsaUIWrapper",
            dependencies: [
                 "AnsaCore",
                 "AnsaUI",
                 .product(name: "BasisTheoryElements", package: "basistheory-ios"),
            ],
            path: "./Sources"
        ),
    ]
)
