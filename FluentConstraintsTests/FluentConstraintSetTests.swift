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

    // MARK: activate()

    func testActivate() {
        let parent = UIView()
        parent.addSubview(firstView)
        parent.addSubview(secondView)

        let constraints = FluentConstraintSet(firstView).sameSize.asView(secondView).activate()
        expect(constraints).to(allPass({ $0!.active == true }))
    }

    func testBuildingAloneDoesNotActivate() {
        let constraints = FluentConstraintSet(firstView).sameSize.asView(secondView).build()
        expect(constraints).to(allPass({ $0!.active == false }))
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
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.CenterX }) == true
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.CenterY }) == true
    }

    func testSameSize() {
        let constraints = FluentConstraintSet(firstView).sameSize.asView(secondView).build()
        expect(constraints.count) == 2
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Width }) == true
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Height }) == true
    }

    func testInset() {
        let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        let constraints = FluentConstraintSet(firstView).inset(insets).onView(secondView).build()
        expect(constraints.count) == 4
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Left && $0.constant == 2 }) == true
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Right && $0.constant == -4 }) == true
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Top && $0.constant == 1 }) == true
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Bottom && $0.constant == -3 }) == true
    }

    func testInsetWithConstant() {
        let constraints = FluentConstraintSet(firstView).inset(10).onView(secondView).build()
        expect(constraints.count) == 4
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Left && $0.constant == 10 }) == true
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Right && $0.constant == -10 }) == true
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Top && $0.constant == 10 }) == true
        expect(constraints.contains() { $0.firstAttribute == NSLayoutAttribute.Bottom && $0.constant == -10 }) == true
    }

    func find(constraints: [NSLayoutConstraint], firstAttribute: NSLayoutAttribute, constant: CGFloat, relation: NSLayoutRelation) -> NSLayoutConstraint? {
        for constraint in constraints {
            if constraint.firstAttribute == firstAttribute && constraint.constant == constant && constraint.relation == relation {
                return constraint
            }
        }

        return nil
    }

    func testInsetAtLeast() {
        let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        let constraints = FluentConstraintSet(firstView).insetAtLeast(insets).onView(secondView).build()
        expect(constraints.count) == 4
        expect(self.find(constraints, firstAttribute: .Left, constant: 2, relation: .GreaterThanOrEqual)).toNot(beNil())
        expect(self.find(constraints, firstAttribute: .Right, constant: -4, relation: .LessThanOrEqual)).toNot(beNil())
        expect(self.find(constraints, firstAttribute: .Top, constant: 1, relation: .GreaterThanOrEqual)).toNot(beNil())
        expect(self.find(constraints, firstAttribute: .Bottom, constant: -3, relation: .LessThanOrEqual)).toNot(beNil())
    }

    func testInsetAtLeastWithConstant() {
        let constraints = FluentConstraintSet(firstView).insetAtLeast(10).onView(secondView).build()
        expect(constraints.count) == 4
        expect(self.find(constraints, firstAttribute: .Left, constant: 10, relation: .GreaterThanOrEqual)).toNot(beNil())
        expect(self.find(constraints, firstAttribute: .Right, constant: -10, relation: .LessThanOrEqual)).toNot(beNil())
        expect(self.find(constraints, firstAttribute: .Top, constant: 10, relation: .GreaterThanOrEqual)).toNot(beNil())
        expect(self.find(constraints, firstAttribute: .Bottom, constant: -10, relation: .LessThanOrEqual)).toNot(beNil())
    }
}
