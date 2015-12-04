# FluentConstraints [![Build Status](https://travis-ci.org/northwoodspd/FluentConstraints.svg)](https://travis-ci.org/northwoodspd/FluentConstraints)

FluentConstraints is a Swift framework intended to make working with Auto Layout constraints in Swift code much easier. While Xcode has excellent support for Auto Layout in Interface Builder, sometimes you can't avoid building UI in code. This wasn't so bad with springs and struts, but Auto Layout requires a minimum of two constraints to position a view, and often more. The visual language helps a little, but it's very limited. `NSLayoutConstraint(item:attribute:relatedBy:toItem:attribute:multiplier:constant:)` provides the most flexibility, but a few of those initializers in a row becomes difficult to read.

For example, this:

    let heightConstraint = NSLayoutConstraint(item: subView, attribute: .Height,
        relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0,
        constant: 0.0)
    heightConstraint.active = true

Can be written as:

    let heightConstraint = FluentConstraint(subView).height.equalTo(self.view).height
        .activate()

Here is a more complex example. This insets a view 20 points from the edges of its superview:

    let leftConstraint = NSLayoutConstraint(item: subView, attribute: .Leading,
        relatedBy: .Equal, toItem: subView.superview, attribute: .Leading,
        multiplier: 1.0, constant: 20)
    let rightConstraint = NSLayoutConstraint(item: subView, attribute: .Trailing,
        relatedBy: .Equal, toItem: subView.superview, attribute: .Trailing,
        multiplier: 1.0, constant: -20)
    let topConstraint = NSLayoutConstraint(item: subView, attribute: .Top,
        relatedBy: .Equal, toItem: subView.superview, attribute: .Top,
        multiplier: 1.0, constant: 20)
    let bottomConstraint = NSLayoutConstraint(item: subView, attribute: .Bottom,
        relatedBy: .Equal, toItem: subView.superview, attribute: .Bottom,
        multiplier: 1.0, constant: -20)
    NSLayoutConstraint.activateConstraints([leftConstraint, rightConstraint, topConstraint,
        bottomConstraint])

It can be written using a `FluentConstraintSet` as:

    let constraints = FluentConstraintSet(subView).inset(20).inSuperview.activate()

## ObjC?

Most of the framework will bridge back to Objective-C, except the relation properties/functions, which essentially makes it unusable from Objective-C. Sorry.

## Installation

FluentConstraints requires iOS 8 or later. There is not currently a Mac OS X target, although nothing in the code is specific to iOS.

### Install via CocoaPods

CocoaPods 0.36.0 or later is required to use Swift frameworks. You need to add `use_frameworks!` and a `pod` line.

    platform :ios, '8.0'

    use_frameworks!

    target 'YOUR APP TARGET HERE', :exclusive => true do
        ...
        pod 'FluentConstraints'          # for Xcode 7 / Swift 2.0
        pod 'FluentConstraints', '<1.0'  # for Xcode 6 / Swift 1.2
    end

    target 'YOUR TEST TARGET HERE', :exclusive => true do
        ...
    end

Don't forget to run `pod install`.

### Install as a Git submodule

    git submodule add https://github.com/northwoodspd/FluentConstraints.git

## Contributing

FluentConstraints was written as an "Imagination Day" project by [@sjmadsen](https://github.com/sjmadsen) and [@msullivan247](https://github.com/msullivan247).

If you'd like to contribute, please:

* Fork the project
* Make your changes
* Please add tests for new functionality or less-than-trivial bug fixes
* Send a pull request

The tests are written with XCTest, but using the [Nimble](https://github.com/Quick/Nimble) matcher framework. You'll need to run `pod install` in your fork before running the tests.

## License

FluentConstraints is provided under the MIT license.
