Swift version of [CPAnimationSequence](https://github.com/yangmeyer/CPAnimationSequence). All credits goes to [Yang Meyer](https://github.com/yangmeyer). Thank you for his inspiring work.

# CPAnimationSequenceSwift
### Usage:

        let animationSequence = CPAnimationSequence.sequenceWithSteps(
            CPAnimationStep.animateFor(4.0, animation: { self.logoView.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.6, animation: { self.welcomeButton.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.6, animation: { self.experienceButton.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.6, animation: { self.knowledgeButton.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.6, animation: { self.challengeButton.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.6, animation: {
                self.moreButton.alpha = 1.0
                for button in self.tabButtons {
                    button.userInteractionEnabled = true
                }
            }))
        animationSequence.run()

### Requirements
* CPAnimationSequenceSwift uses `Swift 2.0`. So, you need to use `Xcode 7` or later to compile this library.
* You can simply drag the files from `SwiftAnimation` folder to your project and use it.

### Enhancements
* Add an example program to use CPAnimationSequenceSwift
* Soon, we will include support for Cocoapods and Carthage.

Feel free to comment, fork and submit pull requests. Thank you.
