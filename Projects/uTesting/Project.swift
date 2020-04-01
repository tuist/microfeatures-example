import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: "uTesting", targets: Set([.framework]), sdks: ["XCTest.framework"])
