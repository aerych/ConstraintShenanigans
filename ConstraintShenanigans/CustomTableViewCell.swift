//
//  CustomTableViewCell.swift
//  ConstraintShenanigans
//
//  Created by aerych on 8/9/15.
//  Copyright (c) 2015 aerych. All rights reserved.
//

import Foundation

@objc public class CustomTableViewCell : UITableViewCell
{
    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!

    public override func awakeFromNib() {
        log(__FUNCTION__)
        heightConstraint.addObserver(self, forKeyPath: "constant", options: .Old | .New, context: nil)
    }

    public override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if heightConstraint == object as! NSObject {
            log(__FUNCTION__)
            let old = change[NSKeyValueChangeOldKey]! as! NSNumber
            let new = change[NSKeyValueChangeNewKey]! as! NSNumber
            NSLog("- Height Old: %@ / New: %@", old, new)
        }
    }

    public override func didMoveToSuperview() {
        log(__FUNCTION__)
    }

    public func hideView() {
        heightConstraint.constant = 0.0
        bottomConstraint.constant = 0.0
        log(__FUNCTION__)
    }

    public func log(functionName: String) {
        NSLog(" ")
        NSLog("%@", functionName)
        NSLog("- Height: %.1f / Bottom: %.1f", heightConstraint.constant, bottomConstraint.constant)
    }
}
