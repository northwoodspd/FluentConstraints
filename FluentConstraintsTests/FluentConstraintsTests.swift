//
//  FluentConstraintsTests.swift
//  FluentConstraintsTests
//
//  Created by Steve Madsen on 11/15/14.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import UIKit
import XCTest
import Nimble

import FluentConstraints

class FluentConstraintsTests: XCTestCase {

    var firstView: UIView!
    var secondView: UIView!

    override func setUp() {
        super.setUp()

        firstView = UIView()
        secondView = UIView()
    }

    func testInitializerArgumentIsConstraintFirstItem() {
        let constraint = FluentConstraint(firstView).top.equalTo(secondView).top.build()
        expect(constraint.firstItem as? UIView) == firstView!
    }

    // MARK: attribute tests

    func testTopAttribute() {
        let constraint = FluentConstraint(firstView).top.equalTo(secondView).top.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Top
        expect(constraint.secondAttribute) == NSLayoutAttribute.Top
    }

    func testBaselineAttribute() {
        let constraint = FluentConstraint(firstView).baseline.equalTo(secondView).baseline.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Baseline
        expect(constraint.secondAttribute) == NSLayoutAttribute.Baseline
    }

    func testFirstBaselineAttribute() {
        let constraint = FluentConstraint(firstView).firstBaseline.equalTo(secondView).firstBaseline.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.FirstBaseline
        expect(constraint.secondAttribute) == NSLayoutAttribute.FirstBaseline
    }

    func testLeftMarginAttribute() {
        let constraint = FluentConstraint(firstView).leftMargin.equalTo(secondView).leftMargin.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.LeftMargin
        expect(constraint.secondAttribute) == NSLayoutAttribute.LeftMargin
    }

    func testRightMarginAttribute() {
        let constraint = FluentConstraint(firstView).rightMargin.equalTo(secondView).rightMargin.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.RightMargin
        expect(constraint.secondAttribute) == NSLayoutAttribute.RightMargin
    }

    func testTopMarginAttribute() {
        let constraint = FluentConstraint(firstView).topMargin.equalTo(secondView).topMargin.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.TopMargin
        expect(constraint.secondAttribute) == NSLayoutAttribute.TopMargin
    }

    func testBottomMarginAttribute() {
        let constraint = FluentConstraint(firstView).bottomMargin.equalTo(secondView).bottomMargin.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.BottomMargin
        expect(constraint.secondAttribute) == NSLayoutAttribute.BottomMargin
    }

    func testLeadingMarginAttribute() {
        let constraint = FluentConstraint(firstView).leadingMargin.equalTo(secondView).leadingMargin.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.LeadingMargin
        expect(constraint.secondAttribute) == NSLayoutAttribute.LeadingMargin
    }

    func testTrailingMarginAttribute() {
        let constraint = FluentConstraint(firstView).trailingMargin.equalTo(secondView).trailingMargin.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.TrailingMargin
        expect(constraint.secondAttribute) == NSLayoutAttribute.TrailingMargin
    }

    func testCenterXWithinMarginsAttribute() {
        let constraint = FluentConstraint(firstView).centerXWithinMargins.equalTo(secondView).centerXWithinMargins.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.CenterXWithinMargins
        expect(constraint.secondAttribute) == NSLayoutAttribute.CenterXWithinMargins
    }

    func testCenterYWithinMarginsAttribute() {
        let constraint = FluentConstraint(firstView).centerYWithinMargins.equalTo(secondView).centerYWithinMargins.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.CenterYWithinMargins
        expect(constraint.secondAttribute) == NSLayoutAttribute.CenterYWithinMargins
    }

    // MARK: relation tests

    func testEqualToRelation() {
        let constraint = FluentConstraint(firstView).top.equalTo(secondView).top.build()
        expect(constraint.relation) == NSLayoutRelation.Equal
    }

    func testEqualToArgumentIsView() {
        let constraint = FluentConstraint(firstView).top.equalTo(secondView).top.build()
        expect(constraint.secondItem).notTo(beNil())
        expect(constraint.secondItem as? UIView) == secondView
    }

    func testEqualToArgumentIsConstant() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).build()
        expect(constraint.constant) == CGFloat(10.0)
    }
}
