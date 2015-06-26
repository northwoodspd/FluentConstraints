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

    // MARK: build collections of constraints

    func testCentered() {
        let constraints = FluentConstraintSet(firstView).centered.onView(secondView).build()
        expect(constraints.count) == 2
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.CenterX }) == true
        expect(contains(constraints) { $0.firstAttribute == NSLayoutAttribute.CenterY }) == true
    }

    }
}
