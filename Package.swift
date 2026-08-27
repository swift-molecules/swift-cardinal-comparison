// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-cardinal-comparison",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Cardinal Comparison",
            targets: ["Cardinal Comparison"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-cardinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-comparison.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Cardinal Comparison",
            dependencies: [
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Comparison", package: "swift-comparison"),
            ]
        ),
        .testTarget(
            name: "Cardinal Comparison Tests",
            dependencies: [
                "Cardinal Comparison"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = [
        .define(
            "SYNCHRONIZATION_AVAILABLE",
            .when(platforms: [.macOS, .iOS, .tvOS, .watchOS, .visionOS, .linux, .windows])
        )
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
