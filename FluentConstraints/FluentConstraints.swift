//
//  FluentConstraints.swift
//  FluentConstraints
//
//  Created by Steve Madsen on 11/15/14.
//  Copyright (c) 2014 Light Year Software, LLC. All rights reserved.
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

    // MARK: attribute functions

    public var top: FluentConstraint {
        if secondItem == nil {
            self.firstAttribute = .Top
        } else {
            self.secondAttribute = .Top
        }
        return self
    }

    public var width: FluentConstraint {
        self.firstAttribute = .Width
        return self
    }
}
