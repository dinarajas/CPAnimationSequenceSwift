Swift version of [CPAnimationSequence](https://github.com/yangmeyer/CPAnimationSequence). All credits goes to [Yang Meyer](https://github.com/yangmeyer). Thank you for his inspiring work.

# CPAnimationSequenceSwift

## Installation
* If you don't use CocoaPods, you can drag and drop the files from **SwiftAnimation** folder into your project and use it.

* If you use CocoaPods, you can see below on how to add CPAnimationSequenceSwift into podfile.

### Podfile

		source 'https://github.com/CocoaPods/Specs.git'
		platform :ios, "8.0"
		use_frameworks!
	
		pod 'CPAnimationSequenceSwift', '0.0.1' 

* If you want to add support from `iOS 7`, you can drag and drop source files into your project and use it. `CocoaPods` for swift supports from `iOS 8` only because of dynamic frameworks.


### Usage

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
* CPAnimationSequenceSwift uses `Swift 2.0`. It requires `Xcode 7` or later.


###License

Copyright (c) 2015 Dinesh Raja.

The CPAnimationSequenceSwift component is released under the [APACHE License](https://github.com/dineshrajas/CPAnimationSequenceSwift/blob/master/License.md).


Feel free to comment, fork and submit pull requests. Thank you.
