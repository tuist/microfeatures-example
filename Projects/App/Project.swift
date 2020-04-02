import ProjectDescription
import ProjectDescriptionHelpers

// Configurations
let appConfigurations: [CustomConfiguration] = [
    .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Application.xcconfig")),
    .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Application.xcconfig"))
]
let testsConfigurations: [CustomConfiguration] = [
    .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
    .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig"))
]
let projectConfigurations: [CustomConfiguration] = [
    .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/Base/Configurations/Debug.xcconfig")),
    .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/Base/Configurations/Release.xcconfig"))
]

// Project
let project = Project(name: "App",
                      organizationName: "Tuist",
                      settings: Settings(configurations: projectConfigurations),
                      targets: [
                        Target(name: "App",
                               platform: .iOS,
                               product: .app,
                               bundleId: "io.tuist.App",
                               infoPlist: .default,
                               sources: ["Sources/App/**/*.swift"],
                               resources: ["Sources/Resources/**/*"],
                               dependencies: [
                                .project(target: "uSearch", path: .relativeToRoot("Projects/uSearch")),
                                .project(target: "uHome", path: .relativeToRoot("Projects/uHome")),
                                .project(target: "uFeatures", path: .relativeToRoot("Projects/uFeatures")),
                                .project(target: "uCore", path: .relativeToRoot("Projects/uCore")),
                                .project(target: "uUI", path: .relativeToRoot("Projects/uUI")),
                                ],
                               settings: Settings(configurations: appConfigurations)),
                        Target(name: "AppTests",
                               platform: .iOS,
                               product: .unitTests,
                               bundleId: "io.tuist.AppTests",
                               infoPlist: .default,
                               sources: ["Tests/**/*.swift"],
                               dependencies: [
                                .target(name: "App"),
                                .project(target: "uTesting", path: .relativeToRoot("Projects/uTesting"))
                                ],
                               settings: Settings(configurations: testsConfigurations)),
                        Target(name: "AppUITests",
                               platform: .iOS,
                               product: .unitTests,
                               bundleId: "io.tuist.AppUITests",
                               infoPlist: .default,
                               sources: ["UITests/**/*.swift"],
                               dependencies: [
                                .target(name: "App"),
                                .project(target: "uTesting", path: .relativeToRoot("Projects/uTesting"))
                                ],
                               settings: Settings(configurations: testsConfigurations))
])
