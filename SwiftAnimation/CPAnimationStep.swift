//
//  CPAnimationStep.swift
//  CPAnimationSequenceSwift
//
//  Created by Dinesh Raja on 10/12/15.
//  Copyright © 2015 April Wings. All rights reserved.
//

import Foundation
import UIKit

public class CPAnimationStep: CustomStringConvertible {
    
    public var delay: NSTimeInterval = 0
    public var duration: NSTimeInterval = 0
    public var animation: () -> () = {}
    public var options: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseInOut
    
    public var description: String {
        get {
            return "Delay: \(self.delay), Duration: \(self.duration)"
        }
    }
    
    private var consumableSteps: Array<AnyObject>?
    private var cancelRequested: Bool = false
    
    // MARK: Configuring animations
    public class func after(delay: NSTimeInterval, animation: () -> ()) -> CPAnimationStep {
        return self.after(delay, forDuration: 0, options: UIViewAnimationOptions.CurveEaseInOut, animation: animation)
    }
    
    public class func animateFor(duration: NSTimeInterval, animation: () -> ()) -> CPAnimationStep {
        return self.after(0, forDuration: duration, options: UIViewAnimationOptions.CurveEaseInOut, animation: animation)
    }
    
    public class func after(delay: NSTimeInterval, forDuration: NSTimeInterval, animation: () -> ()) -> CPAnimationStep{
        return self.after(delay, forDuration: forDuration, options: UIViewAnimationOptions.CurveEaseInOut, animation: animation)
    }
    
    public class func after(delay: NSTimeInterval, forDuration: NSTimeInterval, options: UIViewAnimationOptions, animation: () -> ()) -> CPAnimationStep {
        let animationStep = CPAnimationStep()
        animationStep.delay = delay
        animationStep.duration = forDuration
        animationStep.animation = animation
        animationStep.options = options
        return animationStep
    }

    // MARK: Execute animations
    class func executeAnimations(animations: () -> (), afterDelay: NSTimeInterval) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * afterDelay)), dispatch_get_main_queue(), animations)
    }
    
    func animationStepsArray() -> [CPAnimationStep] {
        return [self]
    }
    
    func animationStep(animated: Bool) -> (() -> ()) {
        return self.animation
    }
    
    public func runAnimated(animated: Bool) {
        if self.cancelRequested {
            return
        }
        
        if self.consumableSteps == nil {
            self.consumableSteps = self.animationStepsArray()
        }
        
        if self.consumableSteps?.count == 0 {
            self.consumableSteps = nil
            return
        }
        
        let animationCompletionHandler = {
            self.consumableSteps?.removeLast()
            self.runAnimated(animated)
        }
        
        let currentStep: CPAnimationStep = self.consumableSteps!.last as! CPAnimationStep
        if (animated && currentStep.duration >= 0.02) {
            UIView.animateWithDuration(currentStep.duration, delay: currentStep.delay, options: currentStep.options, animations: currentStep.animation, completion: { (finished) -> Void in
                if finished {
                    animationCompletionHandler()
                }
            })
        } else {
            let animationExecutionHandler = {
                currentStep.animationStep(true)()
                animationCompletionHandler()
            }
            
            if animated && currentStep.delay != 0 {
                CPAnimationStep.executeAnimations(animationExecutionHandler, afterDelay: currentStep.delay)
            } else {
                animationExecutionHandler()
            }
        }
    }
    
    public func run() {
        self.runAnimated(true)
    }
    
    public func cancel() {
        self.cancelRequested = true
    }
}