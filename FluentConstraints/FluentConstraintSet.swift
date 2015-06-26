//
//  FluentConstraintSet.swift
//  FluentConstraints
//
//  Created by Steve Madsen on 6/26/15.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import Foundation

public class FluentConstraintSet {

    var firstView: UIView
    var constraints: [FluentConstraint] = []

    public init(_ view: UIView) {
        self.firstView = view
    }

    public func build() -> [NSLayoutConstraint] {
        return constraints.map { $0.build() }
    }

    public func centeredOn(secondView: UIView) -> FluentConstraintSet {
        constraints.append(FluentConstraint(firstView).centeredHorizontallyOn(secondView))
        constraints.append(FluentConstraint(firstView).centeredVerticallyOn(secondView))
        return self
    }

    public var centeredInSuperview: FluentConstraintSet {
        precondition(firstView.superview != nil, "View does not have a superview")
        return centeredOn(self.firstView.superview!)
    }
}
