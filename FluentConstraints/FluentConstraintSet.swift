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

    public func activate() -> [NSLayoutConstraint] {
        let constraints = build()
        NSLayoutConstraint.activateConstraints(constraints)
        return constraints
    }

    // MARK: relationship to view

    public var inSuperview: FluentConstraintSet {
        precondition(self.firstView.superview != nil, "View does not have a superview")
        self.constraints.forEach { $0.secondView = self.firstView.superview! }
        return self
    }

    public func onView(view: UIView) -> FluentConstraintSet {
        self.constraints.forEach { $0.secondView = view }
        return self
    }

    public func asView(view: UIView) -> FluentConstraintSet {
        return onView(view)
    }

    // MARK: internal helpers

    func fluentConstraintForView(view: UIView, attribute: NSLayoutAttribute, constant: CGFloat = 0, relation: NSLayoutRelation = .Equal) -> FluentConstraint {
        let constraint = FluentConstraint(view)
        constraint.firstAttribute = attribute
        constraint.relation = relation
        constraint.secondAttribute = attribute
        constraint.constant = constant
        return constraint
    }

    // MARK: builds collections of fluent constraints

    public var centered: FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .CenterX))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .CenterY))
        return self
    }

    public var sameSize: FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Width))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Height))
        return self
    }

    public func inset(insets: UIEdgeInsets) -> FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Left, constant: insets.left))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Right, constant: -insets.right))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Top, constant: insets.top))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Bottom, constant: -insets.bottom))

        return self
    }

    public func inset(constant: CGFloat) -> FluentConstraintSet {
        return inset(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
    }

    public func insetAtLeast(insets: UIEdgeInsets) -> FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Left, constant: insets.left, relation: .GreaterThanOrEqual))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Right, constant: -insets.right, relation: .LessThanOrEqual))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Top, constant: insets.top, relation: .GreaterThanOrEqual))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .Bottom, constant: -insets.bottom, relation: .LessThanOrEqual))

        return self
    }

    public func insetAtLeast(constant: CGFloat) -> FluentConstraintSet {
        return insetAtLeast(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
    }
}
