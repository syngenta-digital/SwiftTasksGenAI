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
            url: "https://github.com/syngenta-digital/package-swift-mediapipe-genai/releases/download/0.10.33-spm.3/MediaPipeTasksGenAI.xcframework.zip",
            checksum: "3ac1e1e482e6b05d69fd72a306e7d1a1f793a542fde36d5c3fc2b929591b35b6"
        ),
        .binaryTarget(
            name: "MediaPipeGenAICLibraries",
            url: "https://github.com/syngenta-digital/package-swift-mediapipe-genai/releases/download/0.10.33-spm.3/MediaPipeGenAICLibraries.xcframework.zip",
            checksum: "257b80a518ca3e9cff0a551693bca3b0b3445f4a6d8383937c0128773ae372ed"
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAIC",
            url: "https://github.com/syngenta-digital/package-swift-mediapipe-genai/releases/download/0.10.33-spm.3/MediaPipeTasksGenAIC.xcframework.zip",
            checksum: "8540cab8872c5d9bfa66d87c9894477849464b615ecdf929f53bc94fda8d1e05"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeGenAI.Info.plist")
            ]
        )
    ]
)
