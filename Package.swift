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
            url: "https://github.com/syngenta-digital/SwiftTasksGenAI/releases/download/0.10.33-spm.2/MediaPipeTasksGenAI.xcframework.zip",
            checksum: "fc29251cb159b01fd7799388baf4a1595aa9e635bdf25e123c9ec6453be24d1c"
        ),
        .binaryTarget(
            name: "MediaPipeGenAICLibraries",
            url: "https://github.com/syngenta-digital/SwiftTasksGenAI/releases/download/0.10.33-spm.2/MediaPipeGenAICLibraries.xcframework.zip",
            checksum: "257b80a518ca3e9cff0a551693bca3b0b3445f4a6d8383937c0128773ae372ed"
        ),
        .binaryTarget(
            name: "MediaPipeTasksGenAIC",
            url: "https://github.com/syngenta-digital/SwiftTasksGenAI/releases/download/0.10.33-spm.2/MediaPipeTasksGenAIC.xcframework.zip",
            checksum: "6a685559233019fc918f940ece66297d5211650e52e3d02e80bd33e8eb0bf7ea"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeGenAI.Info.plist")
            ]
        )
    ]
)
