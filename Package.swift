// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "SwiftTasksGenAI",
    platforms: [
        .iOS(.v13),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftTasksGenAI",
            targets: ["SwiftTasksGenAI"]
        ),
        .library(
            name: "MediaPipeTasksGenAI",
            targets: [
                "MediaPipeGenAICLibraries",
                "MediaPipeTasksGenAIC",
                "MediaPipeTasksGenAI"
            ]
        ),
        .executable(
            name: "UpdatePackage",
            targets: ["UpdatePackage"]
        )
    ],
    targets: [
        .target(
            name: "SwiftTasksGenAI",
            dependencies: ["SwiftTasksGenAICore"]
        ),
        .target(
            name: "SwiftTasksGenAICore",
            dependencies: [
                "MediaPipeGenAICLibraries",
                "MediaPipeTasksGenAIC",
                "MediaPipeTasksGenAI"
            ]
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAI",
            url: "https://github.com/syngenta-digital/package-swift-mediapipe-genai/releases/download/0.10.33/MediaPipeTasksGenAI.xcframework.zip",
            checksum: "5f7c38d8fe4bb7560ca3cd6f5ad2c1faff2a2248ecd523bbf58a6ac47525b3a6"
        ),
        .binaryTarget(
            name: "MediaPipeGenAICLibraries",
            url: "https://github.com/syngenta-digital/package-swift-mediapipe-genai/releases/download/0.10.33/MediaPipeGenAICLibraries.xcframework.zip",
            checksum: "257b80a518ca3e9cff0a551693bca3b0b3445f4a6d8383937c0128773ae372ed"
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAIC",
            url: "https://github.com/syngenta-digital/package-swift-mediapipe-genai/releases/download/0.10.33/MediaPipeTasksGenAIC.xcframework.zip",
            checksum: "7dbc016ed2460b2d7c63f17f18c509295c1b0112c2f630fa39ade049febf2daf"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeGenAI.Info.plist")
            ]
        )
    ]
)
