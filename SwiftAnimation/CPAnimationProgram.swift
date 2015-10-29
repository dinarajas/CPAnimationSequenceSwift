//
//  CPAnimationProgram.swift
//  CPAnimationSequenceSwift
//
//  Created by Dinesh Raja on 10/12/15.
//  Copyright © 2015 April Wings. All rights reserved.
//

import Foundation
import UIKit

public class CPAnimationProgram: CPAnimationStep {
    
    private(set) var animationSteps: Array<CPAnimationStep> = [CPAnimationStep]()
    
    // MARK: Property overriden
    override public var delay:NSTimeInterval {
        get {
            return super.delay
        }
        set {
            assertionFailure("Changing delay on a program is undefined")
        }
    }

    override public var duration:NSTimeInterval {
        get {
            return super.duration
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
    public class func programWithSteps(animationSteps: CPAnimationStep...) -> CPAnimationProgram {
        let animationProgram = CPAnimationProgram()
        animationProgram.animationSteps = animationSteps.reverse()
        return animationProgram
    }

    // MARK: Function Overriden
    public override func cancel() {
        super.cancel()
        if self.animationSteps.count != 0 {
            for animation in self.animationSteps {
                animation.cancel()
            }
        }
    }
    
    // MARK: Sequence generator
    func longestDuration() -> NSTimeInterval {
        var longestAnimation: CPAnimationStep?
        for current: CPAnimationStep in self.animationSteps {
            let currentDuration = current.delay + current.duration
            if (longestAnimation == nil || currentDuration > longestAnimation!.delay + longestAnimation!.duration) {
                longestAnimation = current
            }
        }
        assert(longestAnimation == nil, "Programs seems to have no steps to proceed")
        return Double(self.delay + longestAnimation!.delay + longestAnimation!.duration)
    }
    
    override func animationStepsArray() -> [CPAnimationStep] {
        var steps = [CPAnimationStep]()
        steps.append(CPAnimationStep.after(self.longestDuration(), animation: {}))
        steps.append(self)
        steps.append(CPAnimationStep.after(self.delay, animation: {}))
        return steps
    }
}