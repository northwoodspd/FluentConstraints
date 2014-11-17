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

    public func add() -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: firstItem, attribute: firstAttribute, relatedBy: relation, toItem: secondItem, attribute: secondAttribute, multiplier: CGFloat(multiplier), constant: CGFloat(constant))

        if secondItem != nil {
            var firstItemAncestors = [firstItem]
            var superview = firstItem.superview
            while superview != nil {
                firstItemAncestors.append(superview!)
                superview = superview?.superview
            }

            var secondItemAncestors = [secondItem!]
            superview = secondItem?.superview
            while superview != nil {
                secondItemAncestors.append(superview!)
                superview = superview?.superview
            }

            // Walk the ancestors of firstItem, looking for a match in the ancestors of secondItem
            for ancestorView in firstItemAncestors {
                if contains(secondItemAncestors, ancestorView) {
                    ancestorView.addConstraint(constraint)
                    break
                }
            }
        } else {
            firstItem.addConstraint(constraint)
        }

        return constraint
    }

    // MARK: relation functions

    public func equalTo(view: UIView) -> FluentConstraint {
        relation = .Equal
        secondItem = view
        return self
    }

    public func equalTo(constant: Float) -> FluentConstraint {
        relation = .Equal
        self.constant = constant
        return self
    }

    // MARK: attribute functions

    public var top: FluentConstraint {
        if secondItem == nil {
            firstAttribute = .Top
        } else {
            secondAttribute = .Top
        }
        return self
    }

    public var width: FluentConstraint {
        firstAttribute = .Width
        return self
    }
}
