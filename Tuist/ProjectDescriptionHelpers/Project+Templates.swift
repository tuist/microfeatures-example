import ProjectDescription

extension Project {
    
    public static func app(name: String, platform: Platform, dependencies: [TargetDependency] = []) -> Project {
        return self.project(name: name, product: .app, platform: platform, dependencies: dependencies, infoPlist: [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1"
        ])
    }
    
    public static func framework(name: String, dependencies: [TargetDependency] = []) -> Project {
        let frameworkConfigurations: [CustomConfiguration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Framework.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Framework.xcconfig"))
        ]
        let testsConfigurations: [CustomConfiguration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig"))
        ]
        let appConfigurations: [CustomConfiguration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/iOS/iOS-Base.xcconfig"))
        ]
        let projectConfigurations: [CustomConfiguration] = [
            .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/Base/Configurations/Debug.xcconfig")),
            .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/Base/Configurations/Release.xcconfig"))
        ]
        return Project(name: name,
                       organizationName: "Tuist",
                       settings: Settings(configurations: projectConfigurations),
                       targets: [
                        Target(name: name,
                               platform: .iOS,
                               product: .framework,
                               bundleId: "io.tuist.\(name)",
                            infoPlist: .default,
                            sources: ["Sources/**/*.swift"],
                            resources: ["Resources/**"],
                            dependencies: dependencies,
                            settings: Settings(configurations: frameworkConfigurations)),
                        Target(name: "\(name)Testing",
                            platform: .iOS,
                            product: .framework,
                            bundleId: "io.tuist.\(name)Testing",
                            infoPlist: .default,
                            sources: "Testing/**/*.swift",
                            dependencies: [.target(name: "\(name)")],
                            settings: Settings(configurations: frameworkConfigurations)),
                        Target(name: "\(name)Tests",
                            platform: .iOS,
                            product: .unitTests,
                            bundleId: "io.tuist.\(name)Tests",
                            infoPlist: .default,
                            sources: "Tests/**/*.swift",
                            dependencies: [.target(name: "\(name)")],
                            settings: Settings(configurations: testsConfigurations)),
                        Target(name: "\(name)Example",
                            platform: .iOS,
                            product: .app,
                            bundleId: "io.tuist.\(name)Examples",
                            infoPlist: .default,
                            sources: "Examples/**/*.swift",
                            dependencies: [.target(name: "\(name)")],
                            settings: Settings(configurations: appConfigurations))
        ])
    }

    public static func project(name: String,
                               product: Product,
                               platform: Platform,
                               dependencies: [TargetDependency] = [],
                               infoPlist: [String: InfoPlist.Value] = [:]) -> Project {
        return Project(name: name,
                       targets: [
                        Target(name: name,
                                platform: platform,
                                product: product,
                                bundleId: "io.tuist.\(name)",
                                infoPlist: .extendingDefault(with: infoPlist),
                                sources: ["Sources/**"],
                                resources: [],
                                dependencies: dependencies),
                        Target(name: "\(name)Tests",
                                platform: platform,
                                product: .unitTests,
                                bundleId: "io.tuist.\(name)Tests",
                                infoPlist: .default,
                                sources: "Tests/**",
                                dependencies: [
                                    .target(name: "\(name)")
                                ])
                      ])
    }

}
