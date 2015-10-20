//
//  CPAnimationProgram.swift
//  CPAnimationSequenceSwift
//
//  Created by Dinesh Raja on 10/12/15.
//  Copyright © 2015 April Wings. All rights reserved.
//

import Foundation
import UIKit

class CPAnimationProgram: CPAnimationStep {
    
    private(set) var animationSteps: Array<AnyObject> = [AnyObject]()
    
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
            return super.duration
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
    class func programWithSteps(animationSteps: CPAnimationStep...) -> CPAnimationProgram {
        let animationProgram = CPAnimationProgram()
        animationProgram.animationSteps = animationSteps
        return animationProgram
    }

    // MARK: Function Overriden
    override func cancel() {
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
        for current:CPAnimationStep in self.animationSteps {
            let currentDuration = current.delay + current.duration
            if (longestAnimation == nil || currentDuration > longestAnimation!.delay + longestAnimation!.duration) {
                longestAnimation = current
            }
        }
        assert(longestAnimation == nil, "Programs seems to have no steps to proceed")
        return self.delay + longestAnimation!.delay + longestAnimation!.duration
    }
    
    override func animationStepsArray() -> [AnyObject] {
        var steps = [CPAnimationStep]()
        steps.append(CPAnimationStep.after(self.longestDuration(), animation: {}))
        steps.append(self)
        steps.append(CPAnimationStep.after(self.delay, animation: {}))
        return steps
    }
}