//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!

    var brain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = brain.label();
        progressBar.progress = 0.0
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        brain.handleQuestionNumber()
        UpdateButtons(button: sender, color: brain.checkAnswer(sender.currentTitle! ))
        Timer.scheduledTimer(timeInterval: 0.3,  target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    func UpdateButtons(button: UIButton, color: UIColor) {
        editButtons(false)
        button.backgroundColor = color;
    }

    @objc func updateUI(){
        progressBar.progress = brain.getProgress()
        editButtons(true)
        scoreLabel.text = brain.getScore();
        questionLabel.text = brain.label();
    }

    func editButtons(_ enabled:Bool){
        trueButton.backgroundColor = UIColor.clear;
        falseButton.backgroundColor = UIColor.clear;
        trueButton.isEnabled = enabled;
        falseButton.isEnabled = enabled;
    }

}

