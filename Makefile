bootstrap:
	brew upgrade carthage
	bundle install
	bundle exec pod install
	carthage update --platform iOS