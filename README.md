# µfeatures architecture

[![Build Status](https://travis-ci.org/microfeatures/example.svg?branch=master)](https://travis-ci.org/microfeatures/example)

This repository contains a modular Xcode project built using the µfeatures approach.

## Features
- 🥑 App dependencies fetched with [CocoaPods](https://cocoapods.org).
- 🍒 Core dependencies fetched with [Carthage](https://github.com/carthage).
- 🍇 Configuration in .xcconfig files.
- 🍐 Reusable mocks and testing data.
- 🍊 Example apps to try the features.
- 🍍 Tasks automated in a Makefile.
- 🍎 Continuous integration with [Travis](https://travis-ci.org)

## Setup
1. Git clone the repository: `git clone git@github.com:tuist/microfeatures-example.git`.
2. Intall [Carthage](https://github.com/carthage) if you didn't have it installed.
3. Run `make bootstrap`.
4. Open `ufeatures.xcworkspace`.

## References
- [Modular Xcode Projects](http://ppinera.es/2017/09/29/modular-xcode-projects.html)
- [Framework Oriented Programming](http://frameworkoriented.io/)
- [Building µfeatures](https://speakerdeck.com/pepibumur/building-ufeatures)
