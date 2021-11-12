import ProjectDescription

public enum uFeatureTarget {
    case framework
    case tests
    case examples
    case testing
}

extension Target {
    public static func makeAppTargets(name: String,
                                      dependencies: [String] = [],
                                      testDependencies: [String] = []) -> [Target] {
        let appConfigurations: [ProjectDescription.Configuration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Application.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Application.xcconfig")),
        ]
        let testsConfigurations: [ProjectDescription.Configuration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
        ]
        let targetDependencies: [TargetDependency] = dependencies.map({ .target(name: $0) })
        return [
            Target(name: name,
                   platform: .iOS,
                   product: .app,
                   bundleId: "io.tuist.\(name)",
                infoPlist: .default,
                sources: ["Projects/\(name)/Sources/**/*.swift"],
                resources: ["Projects/\(name)/Resources/**/*"],
                dependencies: targetDependencies,
                settings: Settings.settings(configurations: appConfigurations)),
            Target(name: "\(name)Tests",
                platform: .iOS,
                product: .unitTests,
                bundleId: "io.tuist.\(name)Tests",
                infoPlist: .default,
                sources: ["Projects/\(name)/Tests/**/*.swift"],
                dependencies: [
                    .target(name: name),
                    .xctest,
                    ] + testDependencies.map({ .target(name: $0) }),
                settings: Settings.settings(configurations: testsConfigurations)),
            Target(name: "\(name)UITests",
                platform: .iOS,
                product: .unitTests,
                bundleId: "io.tuist.\(name)UITests",
                infoPlist: .default,
                sources: ["Projects/\(name)/UITests/**/*.swift"],
                dependencies: [
                    .target(name: name),
                    .xctest,
                    ] + testDependencies.map({ .target(name: $0) }),
                settings: Settings.settings(configurations: testsConfigurations)),
        ]
    }
    
    public static func makeFrameworkTargets(name: String,
                                            dependencies: [String] = [],
                                            testDependencies: [String] = [],
                                            targets: Set<uFeatureTarget> = Set([.framework, .tests, .examples, .testing]),
                                            sdks: [String] = [],
                                            dependsOnXCTest: Bool = false) -> [Target] {
        // Configurations
        let frameworkConfigurations: [ProjectDescription.Configuration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Framework.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Framework.xcconfig")),
        ]
        let testsConfigurations: [ProjectDescription.Configuration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
        ]
        let appConfigurations: [ProjectDescription.Configuration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
        ]
        
        // Test dependencies
        var targetTestDependencies: [TargetDependency] = [
            .target(name: "\(name)"),
            .xctest,
            ] + testDependencies.map({ .target(name: $0) })
        dependencies.forEach { targetTestDependencies.append(.target(name: "\($0)Testing")) }
        
        // Target dependencies
        var targetDependencies: [TargetDependency] = dependencies.map { .target(name: $0) }
        targetDependencies.append(contentsOf: sdks.map { .sdk(name: $0) })
        if dependsOnXCTest {
            targetDependencies.append(.xctest)
        }
        
        // Targets
        var projectTargets: [Target] = []
        if targets.contains(.framework) {
            projectTargets.append(Target(name: name,
                                         platform: .iOS,
                                         product: .framework,
                                         bundleId: "io.tuist.\(name)",
                infoPlist: .default,
                sources: ["Projects/\(name)/Sources/**/*.swift"],
                dependencies: targetDependencies,
                settings: Settings.settings(configurations: frameworkConfigurations)))
        }
        if targets.contains(.testing) {
            projectTargets.append(Target(name: "\(name)Testing",
                platform: .iOS,
                product: .framework,
                bundleId: "io.tuist.\(name)Testing",
                infoPlist: .default,
                sources: ["Projects/\(name)/Testing/**/*.swift"],
                dependencies: [.target(name: "\(name)"), .xctest],
                settings: Settings.settings(configurations: frameworkConfigurations)))
        }
        if targets.contains(.tests) {
            projectTargets.append(Target(name: "\(name)Tests",
                platform: .iOS,
                product: .unitTests,
                bundleId: "io.tuist.\(name)Tests",
                infoPlist: .default,
                sources: ["Projects/\(name)/Tests/**/*.swift"],
                dependencies: targetTestDependencies,
                settings: Settings.settings(configurations: testsConfigurations)))
        }
        if targets.contains(.examples) {
            projectTargets.append(Target(name: "\(name)Example",
                platform: .iOS,
                product: .app,
                bundleId: "io.tuist.\(name)Examples",
                infoPlist: .default,
                sources: ["Projects/\(name)/Examples/Sources/**/*.swift"],
                resources: ["Projects/\(name)/Examples/Resources/**"],
                dependencies: [.target(name: "\(name)")],
                settings: Settings.settings(configurations: appConfigurations)))
        }
        return projectTargets
    }
}
