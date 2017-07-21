//
//  ViewController.swift
//  Stopwatch Final
//
//  Created by Suvin Gamage on 7/18/17.
//  Copyright © 2017 Suvin Gamage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var time: UILabel!
    @IBOutlet var startOrstop: UIButton!
    @IBOutlet var resetButton: UIButton!
    var timer = NSTimer()
    let timeInt:NSTimeInterval = 0.5
    let timerEnd:NSTimeInterval = 0.0
    var counter = 0.0
    var timing = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startedorstopped(sender: UIButton) {
        if(timing){
        let actionSel : Selector = "update"
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: actionSel, userInfo: nil, repeats: true)
        timing = false
            startOrstop.setTitle("Stop", forState: .Normal)
        }else{
            timer.invalidate()
            startOrstop.setTitle("Start", forState: .Normal)
            timing = true
        }
        
    }

    @IBAction func resetted(sender: UIButton) {
        time.text = "00:00.00"
        counter = 0.0
    }
    func update(){

        counter += 1.0
        var minutes = floor(counter/100/60)
        
        var seconds = floor(counter/100)
        var mseconds = counter % 100
        
        if (seconds >= 60){
            seconds = seconds % 60
        }

        time.text = "\(minutes):\(seconds):\(mseconds)"

    }
}

