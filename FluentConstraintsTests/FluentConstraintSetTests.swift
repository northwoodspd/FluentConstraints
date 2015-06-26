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

    func testCenteredOn() {
        let constraints = FluentConstraintSet(firstView).centeredOn(secondView).build()
        expect(constraints.count) == 2

        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.CenterX }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.CenterY }) == true
    }
}
