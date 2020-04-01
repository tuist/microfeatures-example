DESTINATION = "platform=iOS Simulator,name=iPhone 11,OS=13.4"
build-core:
	xcodebuild -workspace Projects/uCore/uCore.xcworkspace -scheme uCore -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-core:
	xcodebuild -workspace Projects/uCore/uCore.xcworkspace -scheme uCore -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test
build-testing:
	xcodebuild -workspace Projects/uTesting/uTesting.xcworkspace -scheme uTesting -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
build-features:
	xcodebuild -workspace Projects/uFeatures/uFeatures.xcworkspace -scheme uFeatures -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-features:
	xcodebuild -workspace Projects/uFeatures/uFeatures.xcworkspace -scheme uFeatures -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test
build-ui:
	xcodebuild -workspace Projects/uUI/uUI.xcworkspace -scheme uUI -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-ui:
	xcodebuild -workspace Projects/uUI/uUI.xcworkspace -scheme uUI -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test