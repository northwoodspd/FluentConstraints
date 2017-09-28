//
//  FluentConstraintsTests.swift
//  FluentConstraintsTests
//
//  Created by Steve Madsen on 11/15/14.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import UIKit
import XCTest

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
        XCTAssertEqual(constraint.firstItem as? UIView, firstView)
    }

    // MARK: attribute tests

    func testLeftAttribute() {
        let constraint = FluentConstraint(firstView).left.equalTo(secondView).left.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.left)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.left)
    }

    func testRightAttribute() {
        let constraint = FluentConstraint(firstView).right.equalTo(secondView).right.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.right)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.right)
    }

    func testTopAttribute() {
        let constraint = FluentConstraint(firstView).top.equalTo(secondView).top.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.top)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.top)
    }

    func testBottomAttribute() {
        let constraint = FluentConstraint(firstView).bottom.equalTo(secondView).bottom.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.bottom)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.bottom)
    }

    func testLeadingAttribute() {
        let constraint = FluentConstraint(firstView).leading.equalTo(secondView).leading.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.leading)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.leading)
    }

    func testTrailingAttribute() {
        let constraint = FluentConstraint(firstView).trailing.equalTo(secondView).trailing.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.trailing)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.trailing)
    }

    func testWidthAttribute() {
        let constraint = FluentConstraint(firstView).width.equalTo(secondView).width.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.width)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.width)
    }

    func testHeightAttribute() {
        let constraint = FluentConstraint(firstView).height.equalTo(secondView).height.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.height)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.height)
    }

    func testCenterXAttribute() {
        let constraint = FluentConstraint(firstView).centerX.equalTo(secondView).centerX.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.centerX)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.centerX)
    }

    func testCenterYAttribute() {
        let constraint = FluentConstraint(firstView).centerY.equalTo(secondView).centerY.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.centerY)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.centerY)
    }

    func testLastBaselineAttribute() {
        let constraint = FluentConstraint(firstView).lastBaseline.equalTo(secondView).lastBaseline.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.lastBaseline)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.lastBaseline)
    }

    func testFirstBaselineAttribute() {
        let constraint = FluentConstraint(firstView).firstBaseline.equalTo(secondView).firstBaseline.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.firstBaseline)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.firstBaseline)
    }

    func testLeftMarginAttribute() {
        let constraint = FluentConstraint(firstView).leftMargin.equalTo(secondView).leftMargin.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.leftMargin)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.leftMargin)
    }

    func testRightMarginAttribute() {
        let constraint = FluentConstraint(firstView).rightMargin.equalTo(secondView).rightMargin.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.rightMargin)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.rightMargin)
    }

    func testTopMarginAttribute() {
        let constraint = FluentConstraint(firstView).topMargin.equalTo(secondView).topMargin.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.topMargin)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.topMargin)
    }

    func testBottomMarginAttribute() {
        let constraint = FluentConstraint(firstView).bottomMargin.equalTo(secondView).bottomMargin.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.bottomMargin)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.bottomMargin)
    }

    func testLeadingMarginAttribute() {
        let constraint = FluentConstraint(firstView).leadingMargin.equalTo(secondView).leadingMargin.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.leadingMargin)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.leadingMargin)
    }

    func testTrailingMarginAttribute() {
        let constraint = FluentConstraint(firstView).trailingMargin.equalTo(secondView).trailingMargin.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.trailingMargin)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.trailingMargin)
    }

    func testCenterXWithinMarginsAttribute() {
        let constraint = FluentConstraint(firstView).centerXWithinMargins.equalTo(secondView).centerXWithinMargins.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.centerXWithinMargins)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.centerXWithinMargins)
    }

    func testCenterYWithinMarginsAttribute() {
        let constraint = FluentConstraint(firstView).centerYWithinMargins.equalTo(secondView).centerYWithinMargins.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.centerYWithinMargins)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.centerYWithinMargins)
    }

    // MARK: relation tests

    func testEqualToRelation() {
        let constraint = FluentConstraint(firstView).top.equalTo(secondView).top.build()
        XCTAssertEqual(constraint.relation, NSLayoutRelation.equal)
    }

    func testEqualToArgumentIsView() {
        let constraint = FluentConstraint(firstView).top.equalTo(secondView).top.build()
        XCTAssertNotNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondItem as? UIView, secondView)
    }

    func testEqualToArgumentIsConstant() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).build()
        XCTAssertEqual(constraint.constant, CGFloat(10.0))
    }

    func testEqualToWithoutArgumentIsSelfReference() {
        let constraint = FluentConstraint(firstView).width.equalTo.height.build()
        XCTAssertEqual(constraint.secondItem as? UIView, firstView)
    }

    func testGreaterThanOrEqualToRelation() {
        let constraint = FluentConstraint(firstView).top.greaterThanOrEqualTo(secondView).top.build()
        XCTAssertEqual(constraint.relation, NSLayoutRelation.greaterThanOrEqual)
    }

    func testGreaterThanOrEqualToArgumentIsView() {
        let constraint = FluentConstraint(firstView).top.greaterThanOrEqualTo(secondView).top.build()
        XCTAssertNotNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondItem as? UIView, secondView)
    }

    func testGreaterThanOrEqualToArgumentIsConstant() {
        let constraint = FluentConstraint(firstView).width.greaterThanOrEqualTo(10).build()
        XCTAssertEqual(constraint.constant, CGFloat(10.0))
    }

    func testGreaterThanOrEqualToWithoutArgumentIsSelfReference() {
        let constraint = FluentConstraint(firstView).width.greaterThanOrEqualTo.height.build()
        XCTAssertEqual(constraint.secondItem as? UIView, firstView)
    }

    func testLessThanOrEqualToRelation() {
        let constraint = FluentConstraint(firstView).top.lessThanOrEqualTo(secondView).top.build()
        XCTAssertEqual(constraint.relation, NSLayoutRelation.lessThanOrEqual)
    }

    func testLessThanOrEqualToArgumentIsView() {
        let constraint = FluentConstraint(firstView).top.lessThanOrEqualTo(secondView).top.build()
        XCTAssertNotNil(constraint.secondItem)
        XCTAssertEqual(constraint.secondItem as? UIView, secondView)
    }

    func testLessThanOrEqualToArgumentIsConstant() {
        let constraint = FluentConstraint(firstView).width.lessThanOrEqualTo(10).build()
        XCTAssertEqual(constraint.constant, CGFloat(10.0))
    }

    func testLessThanOrEqualToWithoutArgumentIsSelfReference() {
        let constraint = FluentConstraint(firstView).width.lessThanOrEqualTo.height.build()
        XCTAssertEqual(constraint.secondItem as? UIView, firstView)
    }

    // MARK: multiplier

    func testMultiplierWhenSpecifiedAfterRelation() {
        let constraint = FluentConstraint(firstView).width.equalTo.height.times(1.25).build()
        XCTAssertEqual(constraint.multiplier, 1.25)
    }

    func testMultiplierIsReciprocalWhenSpecifiedBeforeRelation() {
        let constraint = FluentConstraint(firstView).width.times(1.25).equalTo.height.build()
        XCTAssertEqual(constraint.multiplier, 1.0/1.25, accuracy: 0.0001)
    }

    // MARK: constant

    func testPlus() {
        let constraint = FluentConstraint(firstView).width.equalTo(secondView).width.plus(10).build()
        XCTAssertEqual(constraint.constant, 10)
    }

    func testPlusFlipsSignWhenSpecifiedBeforeRelation() {
        let constraint = FluentConstraint(firstView).width.plus(10).equalTo(secondView).width.build()
        XCTAssertEqual(constraint.constant, -10)
    }

    func testMinus() {
        let constraint = FluentConstraint(firstView).width.equalTo(secondView).width.minus(10).build()
        XCTAssertEqual(constraint.constant, -10)
    }

    func testMinusFlipsSignWhenSpecifiedBeforeRelation() {
        let constraint = FluentConstraint(firstView).width.minus(10).equalTo(secondView).width.build()
        XCTAssertEqual(constraint.constant, 10)
    }

    // MARK: priority

    func testPriority() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).priorityValue(750).build()
        XCTAssertEqual(constraint.priority, UILayoutPriority(rawValue: 750))
    }

    func testDefaultPriorityIsRequired() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).build()
        XCTAssertEqual(constraint.priority, UILayoutPriority(rawValue: 1000))
    }

    // MARK: activate()

    func testActivateOnFluentConstraint() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).activate()
        XCTAssert(constraint.isActive)
    }

    func testBuildingAloneDoesNotActivate() {
        let constraint = FluentConstraint(firstView).width.equalTo(10).build()
        XCTAssert(constraint.isActive == false)
    }

    // MARK: convenience functions

    func testCenteredHorizontallyOn() {
        let constraint = FluentConstraint(firstView).centeredHorizontallyOn(secondView).build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.centerX)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(constraint.secondItem as? UIView, secondView)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.centerX)
    }

    func testCenteredHorizontallyInSuperview() {
        secondView.addSubview(firstView)
        let constraint = FluentConstraint(firstView).centeredHorizontallyInSuperview.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.centerX)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(constraint.secondItem as? UIView, secondView)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.centerX)
    }

    func testCenteredVerticallyOn() {
        let constraint = FluentConstraint(firstView).centeredVerticallyOn(secondView).build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.centerY)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(constraint.secondItem as? UIView, secondView)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.centerY)
    }

    func testCenteredVerticallyInSuperview() {
        secondView.addSubview(firstView)
        let constraint = FluentConstraint(firstView).centeredVerticallyInSuperview.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.centerY)
        XCTAssertEqual(constraint.relation, NSLayoutRelation.equal)
        XCTAssertEqual(constraint.secondItem as? UIView, secondView)
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.centerY)
    }
}
