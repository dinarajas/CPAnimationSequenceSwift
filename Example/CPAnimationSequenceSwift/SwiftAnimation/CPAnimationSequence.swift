//
//  CPAnimationSequence.swift
//  CPAnimationSequenceSwift
//
//  Created by Dinesh Raja on 10/12/15.
//  Copyright © 2015 April Wings. All rights reserved.
//

import UIKit

public class CPAnimationSequence: CPAnimationStep {
    
    fileprivate(set) var animationSteps: Array<CPAnimationStep> = [CPAnimationStep]()
    // MARK: Property overriden
    override public var delay:TimeInterval {
        get {
            return super.delay
        }
        set {
            assertionFailure("Changing delay on a program is undefined")
        }
    }
    
    override public var duration:TimeInterval {
        get {
            var fullDuration: TimeInterval = 0.0
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
    
    override public var options:UIViewAnimationOptions {
        get {
            return super.options
        }
        set {
            assertionFailure("Changing options on a program is undefined")
        }
    }

    // MARK: Initializion
    public class func sequenceWithSteps(_ animationSteps: CPAnimationStep...) -> CPAnimationSequence {
        let animationSequence = CPAnimationSequence()
        animationSequence.animationSteps = animationSteps.reversed()
        return animationSequence
    }
    
    // MARK: Function overriden
    public override func cancel() {
        super.cancel()
        for currentStep in self.animationSteps {
            currentStep.cancel()
        }
    }
    
    override func animationStepsArray() -> [CPAnimationStep] {
        var steps = [CPAnimationStep]()
        for step in self.animationSteps {
            steps.append(contentsOf: step.animationStepsArray())
        }
        return steps
    }
}
