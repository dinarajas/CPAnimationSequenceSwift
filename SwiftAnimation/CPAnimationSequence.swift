//
//  CPAnimationSequence.swift
//  CPAnimationSequenceSwift
//
//  Created by Dinesh Raja on 10/12/15.
//  Copyright © 2015 April Wings. All rights reserved.
//

import UIKit

class CPAnimationSequence: CPAnimationStep {
    
    private(set) var animationSteps: Array<CPAnimationStep> = [CPAnimationStep]()
    // MARK: Property overriden
    override var delay:NSTimeInterval {
        get {
            return super.delay
        }
        set {
            assertionFailure("Changing delay on a program is undefined")
        }
    }
    
    override var duration:NSTimeInterval {
        get {
            var fullDuration: NSTimeInterval = 0.0
            for current in self.animationStepsArray() {
                fullDuration += current.delay
                fullDuration += current.duration
            }
            return fullDuration + self.delay
        }
        set {
            assertionFailure("Changing duration on a program is undefined")
        }
    }
    
    override var options:UIViewAnimationOptions {
        get {
            return super.options
        }
        set {
            assertionFailure("Changing options on a program is undefined")
        }
    }

    // MARK: Initializion
    class func sequenceWithSteps(animationSteps: CPAnimationStep...) -> CPAnimationSequence {
        let animationSequence = CPAnimationSequence()
        animationSequence.animationSteps = animationSteps.reverse()
        return animationSequence
    }
    
    // MARK: Function overriden
    override func cancel() {
        super.cancel()
        for currentStep in self.animationSteps {
            currentStep.cancel()
        }
    }
    
    override func animationStepsArray() -> [CPAnimationStep] {
        var steps = [CPAnimationStep]()
        for step in self.animationSteps {
            steps.appendContentsOf(step.animationStepsArray())
        }
        return steps
    }
}
