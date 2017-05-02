//
//  ViewController.swift
//  CPAnimationSequenceSwift
//
//  Created by Dinesh Raja on 10/12/15.
//  Copyright © 2015 April Wings. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animationSequence = CPAnimationSequence.sequenceWithSteps(
            CPAnimationStep.animateFor(1.0, animation: { self.button1.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.8, animation: { self.button2.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.8, animation: { self.button3.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.8, animation: { self.button4.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.8, animation: { self.button5.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.8, animation: { self.button6.alpha = 1.0 }),
            CPAnimationStep.animateFor(0.8, animation: { self.button7.alpha = 1.0 }))
        animationSequence.run()
    }
}

