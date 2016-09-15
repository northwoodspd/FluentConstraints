//
//  FluentConstraints.swift
//  FluentConstraints
//
//  Created by Steve Madsen on 11/15/14.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import UIKit

open class FluentConstraint {
    var firstView: UIView
    var firstAttribute = NSLayoutAttribute.notAnAttribute
    var relation = NSLayoutRelation.equal
    var secondView: UIView?
    var secondAttribute = NSLayoutAttribute.notAnAttribute
    var multiplier: CGFloat = 1.0
    var constant: CGFloat = 0.0
    var priority: UILayoutPriority = 1000.0

    public init(_ view: UIView) {
        self.firstView = view
    }

    open func build() -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: firstView, attribute: firstAttribute, relatedBy: relation, toItem: secondView, attribute: secondAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = self.priority
        return constraint
    }

    open func activate() -> NSLayoutConstraint {
        let constraint = build()
        constraint.isActive = true
        return constraint
    }

    // MARK: relation functions

    open func equalTo(_ view: UIView) -> FluentConstraint {
        self.relation = .equal
        self.secondView = view
        return self
    }

    open func equalTo(_ constant: CGFloat) -> FluentConstraint {
        self.relation = .equal
        self.constant = constant
        return self
    }

    open var equalTo: FluentConstraint {
        self.relation = .equal
        self.secondView = self.firstView
        return self
    }

    open func greaterThanOrEqualTo(_ view: UIView) -> FluentConstraint {
        self.relation = .greaterThanOrEqual
        self.secondView = view
        return self
    }

    open func greaterThanOrEqualTo(_ constant: CGFloat) -> FluentConstraint {
        self.relation = .greaterThanOrEqual
        self.constant = constant
        return self
    }

    open var greaterThanOrEqualTo: FluentConstraint {
        self.relation = .greaterThanOrEqual
        self.secondView = self.firstView
        return self
    }

    open func lessThanOrEqualTo(_ view: UIView) -> FluentConstraint {
        self.relation = .lessThanOrEqual
        self.secondView = view
        return self
    }

    open func lessThanOrEqualTo(_ constant: CGFloat) -> FluentConstraint {
        self.relation = .lessThanOrEqual
        self.constant = constant
        return self
    }

    open var lessThanOrEqualTo: FluentConstraint {
        self.relation = .lessThanOrEqual
        self.secondView = self.firstView
        return self
    }

    // MARK: attribute functions

    open var left: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .left
        } else {
            self.secondAttribute = .left
        }
        return self
    }

    open var right: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .right
        } else {
            self.secondAttribute = .right
        }
        return self
    }

    open var top: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .top
        } else {
            self.secondAttribute = .top
        }
        return self
    }

    open var bottom: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .bottom
        } else {
            self.secondAttribute = .bottom
        }
        return self
    }

    open var leading: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .leading
        } else {
            self.secondAttribute = .leading
        }
        return self
    }

    open var trailing: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .trailing
        } else {
            self.secondAttribute = .trailing
        }
        return self
    }

    open var width: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .width
        } else {
            self.secondAttribute = .width
        }
        return self
    }

    open var height: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .height
        } else {
            self.secondAttribute = .height
        }
        return self
    }

    open var centerX: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .centerX
        } else {
            self.secondAttribute = .centerX
        }
        return self
    }

    open var centerY: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .centerY
        } else {
            self.secondAttribute = .centerY
        }
        return self
    }

    open var lastBaseline: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .lastBaseline
        } else {
            self.secondAttribute = .lastBaseline
        }
        return self
    }

    open var firstBaseline: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .firstBaseline
        } else {
            self.secondAttribute = .firstBaseline
        }
        return self
    }

    open var leftMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .leftMargin
        } else {
            self.secondAttribute = .leftMargin
        }
        return self
    }

    open var rightMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .rightMargin
        } else {
            self.secondAttribute = .rightMargin
        }
        return self
    }

    open var topMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .topMargin
        } else {
            self.secondAttribute = .topMargin
        }
        return self
    }

    open var bottomMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .bottomMargin
        } else {
            self.secondAttribute = .bottomMargin
        }
        return self
    }

    open var leadingMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .leadingMargin
        } else {
            self.secondAttribute = .leadingMargin
        }
        return self
    }

    open var trailingMargin: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .trailingMargin
        } else {
            self.secondAttribute = .trailingMargin
        }
        return self
    }

    open var centerXWithinMargins: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .centerXWithinMargins
        } else {
            self.secondAttribute = .centerXWithinMargins
        }
        return self
    }

    open var centerYWithinMargins: FluentConstraint {
        if secondView == nil {
            self.firstAttribute = .centerYWithinMargins
        } else {
            self.secondAttribute = .centerYWithinMargins
        }
        return self
    }

    // MARK: multiplier

    open func times(_ multiplier: CGFloat) -> FluentConstraint {
        if secondView == nil {
            self.multiplier = 1.0 / multiplier
        } else {
            self.multiplier = multiplier
        }
        return self
    }

    // MARK: constant

    open func plus(_ constant: CGFloat) -> FluentConstraint {
        if secondView == nil {
            self.constant = -constant
        } else {
            self.constant = constant
        }
        return self
    }

    open func minus(_ constant: CGFloat) -> FluentConstraint {
        if secondView == nil {
            self.constant = constant
        } else {
            self.constant = -constant
        }
        return self
    }

    // MARK: priority

    open func priority(_ priority: UILayoutPriority) -> FluentConstraint {
        self.priority = priority
        return self
    }

    // MARK: convenience functions

    open func centeredHorizontallyOn(_ secondView: UIView) -> FluentConstraint {
        self.firstAttribute = .centerX
        self.relation = .equal
        self.secondView = secondView
        self.secondAttribute = .centerX
        return self
    }

    open var centeredHorizontallyInSuperview: FluentConstraint {
        precondition(self.firstView.superview != nil, "View does not have a superview")
        return centeredHorizontallyOn(self.firstView.superview!)
    }

    open func centeredVerticallyOn(_ secondView: UIView) -> FluentConstraint {
        self.firstAttribute = .centerY
        self.relation = .equal
        self.secondView = secondView
        self.secondAttribute = .centerY
        return self
    }

    open var centeredVerticallyInSuperview: FluentConstraint {
        precondition(self.firstView.superview != nil, "View does not have a superview")
        return centeredVerticallyOn(self.firstView.superview!)
    }
}
