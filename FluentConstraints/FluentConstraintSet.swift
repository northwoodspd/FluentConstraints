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

    // MARK: relationship to view

    public var inSuperview: FluentConstraintSet {
        precondition(self.firstView.superview != nil, "View does not have a superview")
        self.constraints.map { $0.secondView = self.firstView.superview! }
        return self
    }

    public func onView(view: UIView) -> FluentConstraintSet {
        self.constraints.map { $0.secondView = view }
        return self
    }

    // MARK: builds collections of fluent constraints

    public var centered: FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .CenterX))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .CenterY))
        return self
    }
        return self
    }

    func fluentConstraintForView(view: UIView, attribute: NSLayoutAttribute, constant: CGFloat = 0) -> FluentConstraint {
        let constraint = FluentConstraint(view)
        constraint.firstAttribute = attribute
        constraint.secondAttribute = attribute
        constraint.constant = constant
        return constraint
    }
}
