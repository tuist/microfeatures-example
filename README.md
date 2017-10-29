# µfeatures architecture

[![Build Status](https://travis-ci.org/pepibumur/ufeatures.svg?branch=master)](https://travis-ci.org/pepibumur/ufeatures)

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
1. Git clone the repository: `git clone git@github.com:carambalabs/ufeatures-example.git`.
2. Intall [Carthage](https://github.com/carthage) if you didn't have it installed.
3. Run `make bootstrap`.
4. Open `ufeatures.xcworkspace`.

## References
- [Modular Xcode Projects](http://ppinera.es/2017/09/29/modular-xcode-projects.html)
- [Framework Oriented Programming](http://frameworkoriented.io/)
- [Building µfeatures](https://speakerdeck.com/pepibumur/building-ufeatures)

## License

The MIT License (MIT)

Copyright (c) 2017 Pedro Piñera

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
