//
//  FluentConstraints.swift
//  FluentConstraints
//
//  Created by Steve Madsen on 11/15/14.
//  Copyright (c) 2015 Northwoods Consulting Partners. All rights reserved.
//

import UIKit

public class FluentConstraint {
    var firstItem: UIView
    var firstAttribute = NSLayoutAttribute.NotAnAttribute
    var relation = NSLayoutRelation.Equal
    var secondItem: UIView?
    var secondAttribute = NSLayoutAttribute.NotAnAttribute
    var multiplier: Float = 1.0
    var constant: Float = 0.0

    public init(_ view: UIView) {
        firstItem = view
    }

    public func build() -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: CGFloat(multiplier), constant: CGFloat(constant))
    }

    // MARK: relation functions

    public func equalTo(view: UIView) -> FluentConstraint {
        self.relation = .Equal
        self.secondItem = view
        return self
    }

    public func equalTo(constant: Float) -> FluentConstraint {
        self.relation = .Equal
        self.constant = constant
        return self
    }

    public func greaterThanOrEqualTo(view: UIView) -> FluentConstraint {
        self.relation = .GreaterThanOrEqual
        self.secondItem = view
        return self
    }

    public func greaterThanOrEqualTo(constant: Float) -> FluentConstraint {
        self.relation = .GreaterThanOrEqual
        self.constant = constant
        return self
    }

    public func lessThanOrEqualTo(view: UIView) -> FluentConstraint {
        self.relation = .LessThanOrEqual
        self.secondItem = view
        return self
    }

    public func lessThanOrEqualTo(constant: Float) -> FluentConstraint {
        self.relation = .LessThanOrEqual
        self.constant = constant
        return self
    }

    // MARK: attribute functions

    public var left: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Left
        } else {
            self.secondAttribute = .Left
        }
        return self
    }

    public var right: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Right
        } else {
            self.secondAttribute = .Right
        }
        return self
    }

    public var top: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Top
        } else {
            self.secondAttribute = .Top
        }
        return self
    }

    public var bottom: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Bottom
        } else {
            self.secondAttribute = .Bottom
        }
        return self
    }

    public var leading: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Leading
        } else {
            self.secondAttribute = .Leading
        }
        return self
    }

    public var trailing: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Trailing
        } else {
            self.secondAttribute = .Trailing
        }
        return self
    }

    public var width: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Width
        } else {
            self.secondAttribute = .Width
        }
        return self
    }

    public var height: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Height
        } else {
            self.secondAttribute = .Height
        }
        return self
    }

    public var centerX: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .CenterX
        } else {
            self.secondAttribute = .CenterX
        }
        return self
    }

    public var centerY: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .CenterY
        } else {
            self.secondAttribute = .CenterY
        }
        return self
    }

    public var baseline: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Baseline
        } else {
            self.secondAttribute = .Baseline
        }
        return self
    }

    public var firstBaseline: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .FirstBaseline
        } else {
            self.secondAttribute = .FirstBaseline
        }
        return self
    }

    public var leftMargin: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .LeftMargin
        } else {
            self.secondAttribute = .LeftMargin
        }
        return self
    }

    public var rightMargin: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .RightMargin
        } else {
            self.secondAttribute = .RightMargin
        }
        return self
    }

    public var topMargin: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .TopMargin
        } else {
            self.secondAttribute = .TopMargin
        }
        return self
    }

    public var bottomMargin: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .BottomMargin
        } else {
            self.secondAttribute = .BottomMargin
        }
        return self
    }

    public var leadingMargin: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .LeadingMargin
        } else {
            self.secondAttribute = .LeadingMargin
        }
        return self
    }

    public var trailingMargin: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .TrailingMargin
        } else {
            self.secondAttribute = .TrailingMargin
        }
        return self
    }

    public var centerXWithinMargins: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .CenterXWithinMargins
        } else {
            self.secondAttribute = .CenterXWithinMargins
        }
        return self
    }

    public var centerYWithinMargins: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .CenterYWithinMargins
        } else {
            self.secondAttribute = .CenterYWithinMargins
        }
        return self
    }
}
