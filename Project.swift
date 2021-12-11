import ProjectDescription
import ProjectDescriptionHelpers

let configurations: [ProjectDescription.Configuration] = [
    .debug(name: "Debug", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/Base/Configurations/Debug.xcconfig")),
    .debug(name: "Release", settings: [String: SettingValue](), xcconfig: .relativeToRoot("Configurations/Base/Configurations/Release.xcconfig")),
]

func targets() -> [Target] {
    var targets: [Target] = []
    targets += Target.makeAppTargets(name: "App", dependencies: ["uSearch", "uHome"], testDependencies: ["uTesting"])
    targets += Target.makeFrameworkTargets(name: "uTesting", targets: Set([.framework]), dependsOnXCTest: true)
    targets += Target.makeFrameworkTargets(name: "uCore")
    targets += Target.makeFrameworkTargets(name: "uUI", testDependencies: ["uTesting"])
    targets += Target.makeFrameworkTargets(name: "uFeatures", dependencies: ["uCore", "uUI"], testDependencies: ["uTesting"], targets: Set([.framework, .tests, .testing]))
    targets += Target.makeFrameworkTargets(name: "uHome", dependencies: ["uFeatures", "uCore", "uUI"], testDependencies: ["uTesting"])
    targets += Target.makeFrameworkTargets(name: "uSearch", dependencies:  ["uFeatures", "uCore", "uUI"], testDependencies: ["uTesting"])
    return targets
}

let project = Project(name: "uFeatures",
                      organizationName: "io.tuist",
                      packages: [],
                      settings: Settings.settings(configurations: configurations),
                      targets: targets())
