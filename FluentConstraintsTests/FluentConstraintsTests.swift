//
//  FluentConstraintsTests.swift
//  FluentConstraintsTests
//
//  Created by Steve Madsen on 11/15/14.
//  Copyright (c) 2014 Light Year Software, LLC. All rights reserved.
//

import UIKit
import XCTest

import FluentConstraints

class FluentConstraintsTests: XCTestCase {

    class MockUIView: UIView {
        override func addConstraint(constraint: NSLayoutConstraint) {
            // no-op
        }
    }

    var firstView: UIView?
    var secondView: UIView?

    override func setUp() {
        super.setUp()

        firstView = MockUIView()
        secondView = MockUIView()
    }

    func testInitializerArgumentIsConstraintFirstItem() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.add()
        XCTAssertEqual(constraint.firstItem as! UIView, firstView!, "Expected constraint's firstItem to be firstView")
    }

    func testAddAddsConstraintToContainingView() {
        firstView = UIView(frame: CGRectZero)
        secondView = UIView(frame: CGRectZero)
        secondView?.addSubview(firstView!)
        FluentConstraint(firstView!).top.equalTo(secondView!).top.add()
        XCTAssertEqual(secondView!.constraints().count, 1, "Expected constraint to be added to secondView")

        firstView!.removeFromSuperview()
        firstView?.addSubview(secondView!)
        FluentConstraint(firstView!).top.equalTo(secondView!).top.add()
        XCTAssertEqual(firstView!.constraints().count, 1, "Expected constraint to be added to firstView")
    }

    func testAddAddsConstraintToNearestCommonAncestor() {
        let containerView = UIView(frame: CGRectZero)
        containerView.addSubview(firstView!)
        containerView.addSubview(secondView!)
        FluentConstraint(firstView!).top.equalTo(secondView!).top.add()
        XCTAssertEqual(containerView.constraints().count, 1, "Expected constraint to be added to the container view")
    }

    func testAddAddsConstraintToFirstItemForSingleViewAttributes() {
        firstView = UIView(frame: CGRectZero)
        FluentConstraint(firstView!).width.equalTo(10).add()
        XCTAssertEqual(firstView!.constraints().count, 1, "Expected constraint to be added to firstView")
    }

    // MARK: attribute tests

    func testTopAttribute() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.add()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Top, "Expected constraint's firstAttribute to be .Top")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Top, "Expected constraint's secondAttribute to be .Top")
    }

    // MARK: relation tests

    func testEqualToRelation() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.add()
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal, "Expected constraint's relation to be .Equal")
    }

    func testEqualToArgumentIsConstraintSecondItem() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.add()
        XCTAssertNotNil(constraint.secondItem, "Constraint's secondItem should not be nil")
        XCTAssertEqual(constraint.secondItem! as UIView, self.secondView!, "Expected constraint's secondItem to be secondView")
    }

    func testEqualToWithNumberAssignsConstant() {
        let constraint = FluentConstraint(firstView!).width.equalTo(10).add()
        XCTAssertEqual(constraint.constant, CGFloat(10.0))
    }
}
