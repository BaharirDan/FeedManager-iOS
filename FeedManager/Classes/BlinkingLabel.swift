//
//  BlinkingLabel.swift
//  Pods-FeedManager_Example
//
//  Created by dan baharir on 22/12/2017.
//

import Foundation

public class BlinkingLabel : UILabel {
    public func startBlinking() {
        let options : UIViewAnimationOptions = [.repeat , .autoreverse]
        UIView.animate(withDuration: 0.15, delay:0.0, options:options, animations: {
            self.alpha = 0
            self.textColor = .blue
        }, completion: nil)
    }
    
    public func stopBlinking() {
        alpha = 1
        layer.removeAllAnimations()
    }
}

