//
//  FluentConstraintSetTests.swift
//  FluentConstraints
//
//  Created by Steve Madsen on 6/26/15.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import UIKit
import XCTest
import Nimble

import FluentConstraints

class FluentConstraintSetTests: XCTestCase {

    var firstView: UIView!
    var secondView: UIView!

    override func setUp() {
        super.setUp()

        firstView = UIView()
        secondView = UIView()
    }

    // MARK: relationship to view

    func testInSuperview() {
        secondView.addSubview(firstView)
        let constraints = FluentConstraintSet(firstView).centered.inSuperview.build()
        expect(constraints).to(allPass({ ($0!.secondItem as? UIView) == self.secondView }))
    }

    func testOnView() {
        let constraints = FluentConstraintSet(firstView).centered.onView(secondView).build()
        expect(constraints).to(allPass({ ($0!.secondItem as? UIView) == self.secondView }))
    }

    func testAsView() {
        let constraints = FluentConstraintSet(firstView).sameSize.asView(secondView).build()
        expect(constraints).to(allPass({ ($0!.secondItem as? UIView) == self.secondView }))
    }

    // MARK: build collections of constraints

    func testCentered() {
        let constraints = FluentConstraintSet(firstView).centered.onView(secondView).build()
        expect(constraints.count) == 2
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.CenterX }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.CenterY }) == true
    }

    func testSameSize() {
        let constraints = FluentConstraintSet(firstView).sameSize.asView(secondView).build()
        expect(constraints.count) == 2
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Width }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Height }) == true
    }

    func testInset() {
        let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        let constraints = FluentConstraintSet(firstView).inset(insets).onView(secondView).build()
        expect(constraints.count) == 4
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Left && $0.constant == 2 }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Right && $0.constant == 4 }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Top && $0.constant == 1 }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Bottom && $0.constant == 3 }) == true
    }

    func testInsetWithConstant() {
        let constraints = FluentConstraintSet(firstView).inset(10).onView(secondView).build()
        expect(constraints.count) == 4
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Left && $0.constant == 10 }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Right && $0.constant == 10 }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Top && $0.constant == 10 }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.Bottom && $0.constant == 10 }) == true
    }
}
