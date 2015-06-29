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

    func testLeftAttribute() {
        let contraint = FluentConstraint(firstView).left.equalTo(secondView).left.build()
        expect(contraint.firstAttribute) == NSLayoutAttribute.Left
        expect(contraint.secondAttribute) == NSLayoutAttribute.Left
    }

    func testRightAttribute() {
        let contraint = FluentConstraint(firstView).right.equalTo(secondView).right.build()
        expect(contraint.firstAttribute) == NSLayoutAttribute.Right
        expect(contraint.secondAttribute) == NSLayoutAttribute.Right
    }

    func testTopAttribute() {
        let constraint = FluentConstraint(firstView).top.equalTo(secondView).top.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Top
        expect(constraint.secondAttribute) == NSLayoutAttribute.Top
    }

    func testBottomAttribute() {
        let constraint = FluentConstraint(firstView).bottom.equalTo(secondView).bottom.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Bottom
        expect(constraint.secondAttribute) == NSLayoutAttribute.Bottom
    }

    func testLeadingAttribute() {
        let constraint = FluentConstraint(firstView).leading.equalTo(secondView).leading.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Leading
        expect(constraint.secondAttribute) == NSLayoutAttribute.Leading
    }

    func testTrailingAttribute() {
        let constraint = FluentConstraint(firstView).trailing.equalTo(secondView).trailing.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Trailing
        expect(constraint.secondAttribute) == NSLayoutAttribute.Trailing
    }

    func testWidthAttribute() {
        let constraint = FluentConstraint(firstView).width.equalTo(secondView).width.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Width
        expect(constraint.secondAttribute) == NSLayoutAttribute.Width
    }

    func testHeightAttribute() {
        let constraint = FluentConstraint(firstView).height.equalTo(secondView).height.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Height
        expect(constraint.secondAttribute) == NSLayoutAttribute.Height
    }

    func testCenterXAttribute() {
        let constraint = FluentConstraint(firstView).centerX.equalTo(secondView).centerX.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.CenterX
        expect(constraint.secondAttribute) == NSLayoutAttribute.CenterX
    }

    func testCenterYAttribute() {
        let constraint = FluentConstraint(firstView).centerY.equalTo(secondView).centerY.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.CenterY
        expect(constraint.secondAttribute) == NSLayoutAttribute.CenterY
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

    func testEqualToWithoutArgumentIsSelfReference() {
        let constraint = FluentConstraint(firstView).width.equalTo.height.build()
        expect(constraint.secondItem as? UIView) == firstView
    }

    func testGreaterThanOrEqualToRelation() {
        let constraint = FluentConstraint(firstView).top.greaterThanOrEqualTo(secondView).top.build()
        expect(constraint.relation) == NSLayoutRelation.GreaterThanOrEqual
    }

    func testGreaterThanOrEqualToArgumentIsView() {
        let constraint = FluentConstraint(firstView).top.greaterThanOrEqualTo(secondView).top.build()
        expect(constraint.secondItem).notTo(beNil())
        expect(constraint.secondItem as? UIView) == secondView
    }

    func testGreaterThanOrEqualToArgumentIsConstant() {
        let constraint = FluentConstraint(firstView).width.greaterThanOrEqualTo(10).build()
        expect(constraint.constant) == CGFloat(10.0)
    }

    func testGreaterThanOrEqualToWithoutArgumentIsSelfReference() {
        let constraint = FluentConstraint(firstView).width.greaterThanOrEqualTo.height.build()
        expect(constraint.secondItem as? UIView) == firstView
    }

    func testLessThanOrEqualToRelation() {
        let constraint = FluentConstraint(firstView).top.lessThanOrEqualTo(secondView).top.build()
        expect(constraint.relation) == NSLayoutRelation.LessThanOrEqual
    }

    func testLessThanOrEqualToArgumentIsView() {
        let constraint = FluentConstraint(firstView).top.lessThanOrEqualTo(secondView).top.build()
        expect(constraint.secondItem).notTo(beNil())
        expect(constraint.secondItem as? UIView) == secondView
    }

    func testLessThanOrEqualToArgumentIsConstant() {
        let constraint = FluentConstraint(firstView).width.lessThanOrEqualTo(10).build()
        expect(constraint.constant) == CGFloat(10.0)
    }

    func testLessThanOrEqualToWithoutArgumentIsSelfReference() {
        let constraint = FluentConstraint(firstView).width.lessThanOrEqualTo.height.build()
        expect(constraint.secondItem as? UIView) == firstView
    }

    // MARK: multiplier

    func testMultiplierWhenSpecifiedAfterRelation() {
        let constraint = FluentConstraint(firstView).width.equalTo.height.times(1.25).build()
        expect(constraint.multiplier) == 1.25
    }

    func testMultiplierIsReciprocalWhenSpecifiedBeforeRelation() {
        let constraint = FluentConstraint(firstView).width.times(1.25).equalTo.height.build()
        expect(constraint.multiplier).to(beCloseTo(1.0 / 1.25, within: 0.0001))
    }

    // MARK: constant

    func testPlus() {
        let constraint = FluentConstraint(firstView).width.equalTo(secondView).width.plus(10).build()
        expect(constraint.constant) == 10
    }

    func testPlusFlipsSignWhenSpecifiedBeforeRelation() {
        let constraint = FluentConstraint(firstView).width.plus(10).equalTo(secondView).width.build()
        expect(constraint.constant) == -10
    }

    func testMinus() {
        let constraint = FluentConstraint(firstView).width.equalTo(secondView).width.minus(10).build()
        expect(constraint.constant) == -10
    }

    func testMinusFlipsSignWhenSpecifiedBeforeRelation() {
        let constraint = FluentConstraint(firstView).width.minus(10).equalTo(secondView).width.build()
        expect(constraint.constant) == 10
    }

    // MARK: priority

    func testPriority() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).priority(750).build()
        expect(constraint.priority) == 750
    }

    func testDefaultPriorityIsRequired() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).build()
        expect(constraint.priority) == 1000
    }

    // MARK: activate()

    func testActivateOnFluentConstraint() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).activate()
        expect(constraint.active) == true
    }

    func testBuildingAloneDoesNotActivate() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).build()
        expect(constraint.active) == false
    }

    // MARK: convenience functions

    func testCenteredHorizontallyOn() {
        let constraint = FluentConstraint(firstView).centeredHorizontallyOn(secondView).build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.CenterX
        expect(constraint.relation) == NSLayoutRelation.Equal
        expect(constraint.secondItem as? UIView) == secondView
        expect(constraint.secondAttribute) == NSLayoutAttribute.CenterX
    }

    func testCenteredHorizontallyInSuperview() {
        secondView.addSubview(firstView)
        let constraint = FluentConstraint(firstView).centeredHorizontallyInSuperview.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.CenterX
        expect(constraint.relation) == NSLayoutRelation.Equal
        expect(constraint.secondItem as? UIView) == secondView
        expect(constraint.secondAttribute) == NSLayoutAttribute.CenterX
    }

    func testCenteredVerticallyOn() {
        let constraint = FluentConstraint(firstView).centeredVerticallyOn(secondView).build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.CenterY
        expect(constraint.relation) == NSLayoutRelation.Equal
        expect(constraint.secondItem as? UIView) == secondView
        expect(constraint.secondAttribute) == NSLayoutAttribute.CenterY
    }

    func testCenteredVerticallyInSuperview() {
        secondView.addSubview(firstView)
        let constraint = FluentConstraint(firstView).centeredVerticallyInSuperview.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.CenterY
        expect(constraint.relation) == NSLayoutRelation.Equal
        expect(constraint.secondItem as? UIView) == secondView
        expect(constraint.secondAttribute) == NSLayoutAttribute.CenterY
    }
}
