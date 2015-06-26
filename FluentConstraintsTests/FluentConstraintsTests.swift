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

    var firstView: UIView?
    var secondView: UIView?

    override func setUp() {
        super.setUp()

        firstView = UIView()
        secondView = UIView()
    }

    func testInitializerArgumentIsConstraintFirstItem() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.build()
        XCTAssertEqual(constraint.firstItem as! UIView, firstView!, "Expected constraint's firstItem to be firstView")
    }

    // MARK: attribute tests

    func testTopAttribute() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.build()
        XCTAssertEqual(constraint.firstAttribute, NSLayoutAttribute.Top, "Expected constraint's firstAttribute to be .Top")
        XCTAssertEqual(constraint.secondAttribute, NSLayoutAttribute.Top, "Expected constraint's secondAttribute to be .Top")
    }

    // MARK: relation tests

    func testEqualToRelation() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.build()
        XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal, "Expected constraint's relation to be .Equal")
    }

    func testEqualToArgumentIsConstraintSecondItem() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.build()
        XCTAssertNotNil(constraint.secondItem, "Constraint's secondItem should not be nil")
        XCTAssertEqual(constraint.secondItem! as! UIView, self.secondView!, "Expected constraint's secondItem to be secondView")
    }

    func testEqualToWithNumberAssignsConstant() {
        let constraint = FluentConstraint(firstView!).width.equalTo(10).build()
        XCTAssertEqual(constraint.constant, CGFloat(10.0))
    }
}
