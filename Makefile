bootstrap:
	bundle install
	bundle exec pod install
	carthage update --platform iOS

DESTINATION = "platform=iOS Simulator,name=iPhone 6,OS=11.1"
build-core:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uCore -config Debug clean build | bundle exec xcpretty
build-ui:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uUI -config Debug clean build | bundle exec xcpretty
build-testing:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uTesting -config Debug clean build | bundle exec xcpretty
build-dependencies:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uDependencies -config Debug clean build | bundle exec xcpretty
build-search:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uSearch -config Debug clean build | bundle exec xcpretty
build-home:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uHome -config Debug clean build | bundle exec xcpretty
build-features:
	xcodebuild -workspace uFeatures.xcworkspace -scheme "All ufeatures" -config Debug clean build | bundle exec xcpretty
build-app:
	xcodebuild -workspace uFeatures.xcworkspace -scheme ufeatures -config Debug clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO | bundle exec xcpretty
build-examples:
	xcodebuild -workspace uFeatures.xcworkspace -scheme "All Examples" -config Debug clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO | bundle exec xcpretty
test-core:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uCore -config Debug clean test -destination $(DESTINATION) | bundle exec xcpretty
test-ui:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uUI -config Debug clean test -destination $(DESTINATION) | bundle exec xcpretty
test-testing:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uTesting -config Debug clean test -destination $(DESTINATION) | bundle exec xcpretty
test-search:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uSearch -config Debug clean test -destination $(DESTINATION) | bundle exec xcpretty
test-home:
	xcodebuild -workspace uFeatures.xcworkspace -scheme uHome -config Debug clean test -destination $(DESTINATION) | bundle exec xcpretty
test-features:
	xcodebuild -workspace uFeatures.xcworkspace -scheme "All ufeatures" -config Debug clean test -destination $(DESTINATION) | bundle exec xcpretty
test-app:
	xcodebuild -workspace uFeatures.xcworkspace -scheme ufeatures -config Debug clean test -destination $(DESTINATION) | bundle exec xcpretty
