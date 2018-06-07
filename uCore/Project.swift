import ProjectDescription

let project = Project(name: "uCore",
                      schemes: [],
                      settings: Settings(base: [:]),
                      targets: [
                        Target(name: "uCore",
                               platform: .iOS,
                               product: .framework,
                               bundleId: "com.xcodepm.uCore",
                               infoPlist: "Info.plist",
                               dependencies: [],
                               settings: nil,
                               buildPhases: [
                                .sources([.sources("./Sources/*.swift")]),
                                ]),
                        Target(name: "uCoreTests",
                               platform: .iOS,
                               product: .unitTests,
                               bundleId: "com.xcodepm.uCoreTests",
                               infoPlist: "Tests.plist",
                               dependencies: [
                            .target(name: "uCore")
                            ],
                               settings: nil,
                               buildPhases: [
                                .sources([.sources("./Tests/*.swift")]),
                                ]),
                        Target(name: "uCoreExamples",
                               platform: .iOS,
                               product: .app,
                               bundleId: "com.xcodepm.uCoreExamples",
                               infoPlist: "Tests.plist",
                               dependencies: [
                                .target(name: "uCore")
                            ],
                               settings: nil,
                               buildPhases: [
                                .sources([.sources("./Examples/Sources/*.swift")]),
                                .resources([.resources("./Examples/Resources/*")])
                                ]),
                        ])
