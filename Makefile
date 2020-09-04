DESTINATION = "platform=iOS Simulator,name=iPhone 11,OS=13.5"
build-core:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uCore -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-core:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uCore -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test
build-testing:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uTesting -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
build-features:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uFeatures -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-features:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uFeatures -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test
build-ui:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uUI -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-ui:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uUI -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test
build-home:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uHome -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-home:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uHome -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test
build-search:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uSearch -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-search:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uSearch -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test
build-app:
	xcodebuild -workspace uFeatures.xcworkspace -scheme App -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
test-app:
	xcodebuild -workspace uFeatures.xcworkspace -scheme App -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean test