//
//  FluentConstraintSet.swift
//  FluentConstraints
//
//  Created by Steve Madsen on 6/26/15.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import Foundation

open class FluentConstraintSet {

    var firstView: UIView
    var constraints: [FluentConstraint] = []

    public init(_ view: UIView) {
        self.firstView = view
    }

    open func build() -> [NSLayoutConstraint] {
        return constraints.map { $0.build() }
    }

    open func activate() -> [NSLayoutConstraint] {
        let constraints = build()
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    // MARK: relationship to view

    open var inSuperview: FluentConstraintSet {
        precondition(self.firstView.superview != nil, "View does not have a superview")
        self.constraints.forEach { $0.secondView = self.firstView.superview! }
        return self
    }

    open func onView(_ view: UIView) -> FluentConstraintSet {
        self.constraints.forEach { $0.secondView = view }
        return self
    }

    open func asView(_ view: UIView) -> FluentConstraintSet {
        return onView(view)
    }

    // MARK: internal helpers

    func fluentConstraintForView(_ view: UIView, attribute: NSLayoutAttribute, constant: CGFloat = 0, relation: NSLayoutRelation = .equal) -> FluentConstraint {
        let constraint = FluentConstraint(view)
        constraint.firstAttribute = attribute
        constraint.relation = relation
        constraint.secondAttribute = attribute
        constraint.constant = constant
        return constraint
    }

    // MARK: builds collections of fluent constraints

    open var centered: FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .centerX))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .centerY))
        return self
    }

    open var sameSize: FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .width))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .height))
        return self
    }

    open func inset(_ insets: UIEdgeInsets) -> FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .left, constant: insets.left))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .right, constant: -insets.right))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .top, constant: insets.top))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .bottom, constant: -insets.bottom))

        return self
    }

    open func inset(_ constant: CGFloat) -> FluentConstraintSet {
        return inset(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
    }

    open func insetAtLeast(_ insets: UIEdgeInsets) -> FluentConstraintSet {
        constraints.append(fluentConstraintForView(self.firstView, attribute: .left, constant: insets.left, relation: .greaterThanOrEqual))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .right, constant: -insets.right, relation: .lessThanOrEqual))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .top, constant: insets.top, relation: .greaterThanOrEqual))
        constraints.append(fluentConstraintForView(self.firstView, attribute: .bottom, constant: -insets.bottom, relation: .lessThanOrEqual))

        return self
    }

    open func insetAtLeast(_ constant: CGFloat) -> FluentConstraintSet {
        return insetAtLeast(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
    }
}
