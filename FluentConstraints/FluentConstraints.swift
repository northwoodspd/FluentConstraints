//
//  FluentConstraints.swift
//  FluentConstraints
//
//  Created by Steve Madsen on 11/15/14.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import UIKit

public class FluentConstraint {
    var firstView: UIView
    var firstAttribute = NSLayoutAttribute.NotAnAttribute
    var relation = NSLayoutRelation.Equal
    var secondView: UIView?
    var secondAttribute = NSLayoutAttribute.NotAnAttribute
    var multiplier: CGFloat = 1.0
    var constant: CGFloat = 0.0
    var priority: UILayoutPriority = 1000.0

    public init(_ view: UIView) {
        self.firstView = view
    }

    public func build() -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: firstView, attribute: firstAttribute, relatedBy: relation, toItem: secondView, attribute: secondAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = self.priority
        return constraint
    }

    public func activate() -> NSLayoutConstraint {
        let constraint = build()
        constraint.active = true
        return constraint
    }

    // MARK: relation functions

    public func equalTo(view: UIView) -> FluentConstraint {
        self.relation = .Equal
        self.secondView = view
        return self
    }

    public func equalTo(constant: CGFloat) -> FluentConstraint {
        self.relation = .Equal
        self.constant = constant
        return self
    }

    public var equalTo: FluentConstraint {
        self.relation = .Equal
        self.secondView = self.firstView
        return self
    }

    public func greaterThanOrEqualTo(view: UIView) -> FluentConstraint {
        self.relation = .GreaterThanOrEqual
        self.secondView = view
        return self
    }

    public func greaterThanOrEqualTo(constant: CGFloat) -> FluentConstraint {
        self.relation = .GreaterThanOrEqual
        self.constant = constant
        return self
    }

    public var greaterThanOrEqualTo: FluentConstraint {
        self.relation = .GreaterThanOrEqual
        self.secondView = self.firstView
        return self
    }

    public func lessThanOrEqualTo(view: UIView) -> FluentConstraint {
        self.relation = .LessThanOrEqual
        self.secondView = view
        return self
    }

    public func lessThanOrEqualTo(constant: CGFloat) -> FluentConstraint {
        self.relation = .LessThanOrEqual
        self.constant = constant
        return self
    }

    public var lessThanOrEqualTo: FluentConstraint {
        self.relation = .LessThanOrEqual
        self.secondView = self.firstView
        return self
    }

    // MARK: attribute functions

    public var left: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Left
        } else {
            self.secondAttribute = .Left
        }
        return self
    }

    public var right: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Right
        } else {
            self.secondAttribute = .Right
        }
        return self
    }

    public var top: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Top
        } else {
            self.secondAttribute = .Top
        }
        return self
    }

    public var bottom: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Bottom
        } else {
            self.secondAttribute = .Bottom
        }
        return self
    }

    public var leading: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Leading
        } else {
            self.secondAttribute = .Leading
        }
        return self
    }

    public var trailing: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Trailing
        } else {
            self.secondAttribute = .Trailing
        }
        return self
    }

    public var width: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Width
        } else {
            self.secondAttribute = .Width
        }
        return self
    }

    public var height: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Height
        } else {
            self.secondAttribute = .Height
        }
        return self
    }

    public var centerX: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .CenterX
        } else {
            self.secondAttribute = .CenterX
        }
        return self
    }

    public var centerY: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .CenterY
        } else {
            self.secondAttribute = .CenterY
        }
        return self
    }

    public var baseline: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .Baseline
        } else {
            self.secondAttribute = .Baseline
        }
        return self
    }

    public var firstBaseline: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .FirstBaseline
        } else {
            self.secondAttribute = .FirstBaseline
        }
        return self
    }

    public var leftMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .LeftMargin
        } else {
            self.secondAttribute = .LeftMargin
        }
        return self
    }

    public var rightMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .RightMargin
        } else {
            self.secondAttribute = .RightMargin
        }
        return self
    }

    public var topMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .TopMargin
        } else {
            self.secondAttribute = .TopMargin
        }
        return self
    }

    public var bottomMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .BottomMargin
        } else {
            self.secondAttribute = .BottomMargin
        }
        return self
    }

    public var leadingMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .LeadingMargin
        } else {
            self.secondAttribute = .LeadingMargin
        }
        return self
    }

    public var trailingMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .TrailingMargin
        } else {
            self.secondAttribute = .TrailingMargin
        }
        return self
    }

    public var centerXWithinMargins: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .CenterXWithinMargins
        } else {
            self.secondAttribute = .CenterXWithinMargins
        }
        return self
    }

    public var centerYWithinMargins: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .CenterYWithinMargins
        } else {
            self.secondAttribute = .CenterYWithinMargins
        }
        return self
    }

    // MARK: multiplier

    public func times(multiplier: CGFloat) -> FluentConstraint {
        if secondView == nil {
            self.multiplier = 1.0 / multiplier
        } else {
            self.multiplier = multiplier
        }
        return self
    }

    // MARK: constant

    public func plus(constant: CGFloat) -> FluentConstraint {
        if secondView == nil {
            self.constant = -constant
        } else {
            self.constant = constant
        }
        return self
    }

    public func minus(constant: CGFloat) -> FluentConstraint {
        if secondView == nil {
            self.constant = constant
        } else {
            self.constant = -constant
        }
        return self
    }

    // MARK: priority

    public func priority(priority: UILayoutPriority) -> FluentConstraint {
        self.priority = priority
        return self
    }

    // MARK: convenience functions

    public func centeredHorizontallyOn(secondView: UIView) -> FluentConstraint {
        self.firstAttribute = .CenterX
        self.relation = .Equal
        self.secondView = secondView
        self.secondAttribute = .CenterX
        return self
    }

    public var centeredHorizontallyInSuperview: FluentConstraint {
        precondition(self.firstView.superview != nil, "View does not have a superview")
        return centeredHorizontallyOn(self.firstView.superview!)
    }

    public func centeredVerticallyOn(secondView: UIView) -> FluentConstraint {
        self.firstAttribute = .CenterY
        self.relation = .Equal
        self.secondView = secondView
        self.secondAttribute = .CenterY
        return self
    }

    public var centeredVerticallyInSuperview: FluentConstraint {
        precondition(self.firstView.superview != nil, "View does not have a superview")
        return centeredVerticallyOn(self.firstView.superview!)
    }
}
