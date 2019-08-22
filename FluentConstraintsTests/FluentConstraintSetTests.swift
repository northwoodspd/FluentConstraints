//
//  FluentConstraintSetTests.swift
//  FluentConstraints
//
//  Created by Steve Madsen on 6/26/15.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import UIKit
import XCTest

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
        constraints.forEach({ XCTAssert($0.isActive) })
    }

    func testBuildingAloneDoesNotActivate() {
        let constraints = FluentConstraintSet(firstView).sameSize.asView(secondView).build()
        constraints.forEach({ XCTAssert($0.isActive == false) })
    }

    // MARK: relationship to view

    func testInSuperview() {
        secondView.addSubview(firstView)
        let constraints = FluentConstraintSet(firstView).centered.inSuperview.build()
        constraints.forEach({ XCTAssertEqual($0.secondItem as? UIView, self.secondView) })
    }

    func testOnView() {
        let constraints = FluentConstraintSet(firstView).centered.onView(secondView).build()
        constraints.forEach({ XCTAssertEqual($0.secondItem as? UIView, self.secondView) })
    }

    func testAsView() {
        let constraints = FluentConstraintSet(firstView).sameSize.asView(secondView).build()
        constraints.forEach({ XCTAssertEqual($0.secondItem as? UIView, self.secondView) })
    }

    // MARK: build collections of constraints

    func testCentered() {
        let constraints = FluentConstraintSet(firstView).centered.onView(secondView).build()
        XCTAssertEqual(constraints.count, 2);
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.centerX })
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.centerY })
    }

    func testSameSize() {
        let constraints = FluentConstraintSet(firstView).sameSize.asView(secondView).build()
        XCTAssertEqual(constraints.count, 2);
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.width })
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.height })
    }

    func testInset() {
        let insets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
        let constraints = FluentConstraintSet(firstView).inset(insets).onView(secondView).build()
        XCTAssertEqual(constraints.count, 4);
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.left && $0.constant == 2 })
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.right && $0.constant == -4 })
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.top && $0.constant == 1 })
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.bottom && $0.constant == -3 })
    }

    func testInsetWithConstant() {
        let constraints = FluentConstraintSet(firstView).inset(10).onView(secondView).build()
        XCTAssertEqual(constraints.count, 4);
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.left && $0.constant == 10 })
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.right && $0.constant == -10 })
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.top && $0.constant == 10 })
        XCTAssert(constraints.contains() { $0.firstAttribute == NSLayoutConstraint.Attribute.bottom && $0.constant == -10 })
    }

    func find(constraints: [NSLayoutConstraint], firstAttribute: NSLayoutConstraint.Attribute, constant: CGFloat, relation: NSLayoutConstraint.Relation) -> NSLayoutConstraint? {
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
        XCTAssertEqual(constraints.count, 4);
        XCTAssertNotNil(self.find(constraints: constraints, firstAttribute: .left, constant: 2, relation: .greaterThanOrEqual))
        XCTAssertNotNil(self.find(constraints: constraints, firstAttribute: .right, constant: -4, relation: .lessThanOrEqual))
        XCTAssertNotNil(self.find(constraints: constraints, firstAttribute: .top, constant: 1, relation: .greaterThanOrEqual))
        XCTAssertNotNil(self.find(constraints: constraints, firstAttribute: .bottom, constant: -3, relation: .lessThanOrEqual))
    }

    func testInsetAtLeastWithConstant() {
        let constraints = FluentConstraintSet(firstView).insetAtLeast(10).onView(secondView).build()
        XCTAssertEqual(constraints.count, 4);
        XCTAssertNotNil(self.find(constraints: constraints, firstAttribute: .left, constant: 10, relation: .greaterThanOrEqual))
        XCTAssertNotNil(self.find(constraints: constraints, firstAttribute: .right, constant: -10, relation: .lessThanOrEqual))
        XCTAssertNotNil(self.find(constraints: constraints, firstAttribute: .top, constant: 10, relation: .greaterThanOrEqual))
        XCTAssertNotNil(self.find(constraints: constraints, firstAttribute: .bottom, constant: -10, relation: .lessThanOrEqual))
    }
}
