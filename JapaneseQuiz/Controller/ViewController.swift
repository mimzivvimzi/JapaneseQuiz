//
//  ViewController.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/05/14.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    let allQuestions = QuestionBank()
    var questionNumber = 0
    var randomNumberForCorrectAnswer: Int?
    var randomNumberForWrongAnswer: Int?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    func showQuestion() {
        if questionNumber < allQuestions.questionList.count-1 {
            questionLabel.text = allQuestions.questionList[questionNumber].question
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions", preferredStyle: .alert)
            
            let stop = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(stop)
            
            present(alert, animated: true, completion: nil)
            startOver()
        }
        
        let answer = allQuestions.questionList[questionNumber].correctAnswer
        let wrong = allQuestions.questionList[questionNumber].wrongAnswer
        
        let randomNumber = randomizeButtonLabel()
        
        if randomNumber == 1 {
            randomNumberForWrongAnswer = 2
            button1.setTitle(answer, for: .normal)
            button2.setTitle(wrong, for: .normal)
        } else {
            randomNumberForWrongAnswer = 1
            button2.setTitle(answer, for: .normal)
            button1.setTitle(wrong, for: .normal)
        }
    }
    
    func randomizeButtonLabel() -> Int {
        randomNumberForCorrectAnswer = Int.random(in: 1...2)
        return randomNumberForCorrectAnswer!
    }
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        let correctAnswer = allQuestions.questionList[questionNumber].correctAnswer
        if button1.currentTitle == correctAnswer {
            print("Correct")
        } else {
            print("Wrong")
        }
        if questionNumber < 5 {
            questionNumber += 1
        }
        showQuestion()
    }
    
    @IBAction func button2Pressed(_ sender: UIButton) {
        let correctAnswer = allQuestions.questionList[questionNumber].correctAnswer
        if button2.currentTitle == correctAnswer {
            print("Correct!")
        } else {
            print("Wrong!")
        }
        if questionNumber < allQuestions.questionList.count-1 {
            questionNumber += 1
        }
        showQuestion()
    }
    
    func startOver() {
        questionNumber = 0
        showQuestion()
    }
    
    
}

