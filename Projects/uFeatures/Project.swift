import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(name: "uFeatures", targets: Set([.framework, .tests]), dependencies: ["uCore"])
