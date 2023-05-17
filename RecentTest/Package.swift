// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RecentTest",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DangerDeps", // Danger needs to build this library, then its name needs to start with DangerDeps in order to be identified by Danger
                     type: .dynamic, // If the type is not dynamic Danger can not link it to the Dangerfile compilation
            targets: ["RecentTest"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/danger/swift.git", from: "3.16.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .target(
            name: "RecentTest",
            dependencies: [
                .product(name:"Danger",package: "swift")
                ],
            sources: ["Stringify.swift"]),
        .testTarget(
            name: "RecentTestTests",
            dependencies: ["RecentTest"]),
    ]
)
