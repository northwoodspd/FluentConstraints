//
//  FluentConstraintsTests.swift
//  FluentConstraintsTests
//
//  Created by Steve Madsen on 11/15/14.
//  Copyright (c) 2014 Light Year Software, LLC. All rights reserved.
//

import UIKit
import XCTest
import Nimble

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
        expect(constraint.firstItem as? UIView) == firstView!
    }

    // MARK: attribute tests

    func testTopAttribute() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.build()
        expect(constraint.firstAttribute) == NSLayoutAttribute.Top
        expect(constraint.secondAttribute) == NSLayoutAttribute.Top
    }

    // MARK: relation tests

    func testEqualToRelation() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.build()
        expect(constraint.relation) == NSLayoutRelation.Equal
    }

    func testEqualToArgumentIsConstraintSecondItem() {
        let constraint = FluentConstraint(firstView!).top.equalTo(secondView!).top.build()
        expect(constraint.secondItem).notTo(beNil())
        expect(constraint.secondItem as? UIView) == secondView!
    }

    func testEqualToWithNumberAssignsConstant() {
        let constraint = FluentConstraint(firstView!).width.equalTo(10).build()
        expect(constraint.constant) == CGFloat(10.0)
    }
}
