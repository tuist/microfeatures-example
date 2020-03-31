DESTINATION = "platform=iOS Simulator,name=iPhone 11,OS=13.4"
build-core:
	xcodebuild -workspace Projects/uCore/uCore.xcworkspace -scheme uCore -config Debug -destination $(DESTINATION) -sdk iphonesimulator clean build
build-ui:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uUI -config Debug clean build
build-testing:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uTesting -config Debug clean build
build-dependencies:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uDependencies -config Debug clean build
build-search:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uSearch -config Debug clean build
build-home:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uHome -config Debug clean build
build-features:
	xcodebuild -workspace uFeatures.xcworkspace -scheme "All ufeatures" -config Debug clean build
build-app:
	xcodebuild -workspace uFeatures.xcworkspace -scheme ufeatures -config Debug clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
build-examples:
	xcodebuild -workspace uFeatures.xcworkspace -scheme "All Examples" -config Debug clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO
test-core:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uCore -config Debug clean test -destination $(DESTINATION)
test-ui:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uUI -config Debug clean test -destination $(DESTINATION)
test-testing:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uTesting -config Debug clean test -destination $(DESTINATION)
test-search:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uSearch -config Debug clean test -destination $(DESTINATION)
test-home:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uHome -config Debug clean test -destination $(DESTINATION)
test-features:
	xcodebuild -workspace uFeatures.xcworkspace -scheme "All ufeatures" -config Debug clean test -destination $(DESTINATION)
test-app:
	xcodebuild -workspace uFeatures.xcworkspace -scheme ufeatures -config Debug clean test -destination $(DESTINATION)
