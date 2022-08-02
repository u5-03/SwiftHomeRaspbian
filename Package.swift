// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftHomeRaspbian",
    platforms: [
        .macOS(.v10_14)
    ],
    dependencies: [
        .package(url: "git@github.com:u5-03/SwiftHomeCredentials.git", from: "1.0.0"),
        .package(url: "https://github.com/mironal/TwitterAPIKit", from: "0.0.1"),
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.0.0"),
        .package(url: "https://github.com/kylef/PathKit", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SwiftHomeRaspbian",
            dependencies: [
                .product(name: "SwiftHomeCredentials", package: "SwiftHomeCredentials"),
                .product(name: "TwitterAPIKit", package: "TwitterAPIKit"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "PathKit", package: "PathKit"),
            ]),
        .testTarget(
            name: "SwiftHomeRaspbianTests",
            dependencies: ["SwiftHomeRaspbian"]),
    ]
)
