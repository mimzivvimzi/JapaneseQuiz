//
//  JLPT2ViewController.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/06/28.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import UIKit

class JLPT2ViewController: UIViewController {

    
    @IBOutlet weak var beginningOfQuestion: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var allQuestions = [Question]()
    var myWordArray = [Word]()
    var questionNumber = 0
    var randomNumberForCorrectAnswer: Int?
    var randomNumberForWrongAnswer: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.isHidden = true
        button2.isHidden = true
        questionLabel.isHidden = true
        beginningOfQuestion.isHidden = true
        setUpConstraints()
        button1.layer.cornerRadius = 20
        button2.layer.cornerRadius = 20
        self.view.backgroundColor = #colorLiteral(red: 0.9681944251, green: 0.8723551035, blue: 0.958781302, alpha: 0.8176637414)
        let url = "https://jisho.org/api/v1/search/words?keyword=%23jlpt-n2"
        performRequest(with: url) { (questions) in
            DispatchQueue.main.async {
                self.allQuestions = questions
                self.showQuestion()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
//    func activityIndicator() {
//        let x = view.center.x
//        let y = view.center.y
//        let frame = CGRect(x: (x - 50), y: (y - 50), width: 100, height: 100)
//        activityIndicatorView = NVActivityIndicatorView(frame: frame)
//        activityIndicatorView!.type = .circleStrokeSpin
//        activityIndicatorView!.color = UIColor.systemGray6
//        self.view.addSubview(activityIndicatorView!)
//        activityIndicatorView!.startAnimating()
//    }
    
    func showQuestion() {
//        activityIndicatorView!.stopAnimating()
        button1.isHidden = false
        button2.isHidden = false
        questionLabel.isHidden = false
        beginningOfQuestion.isHidden = false
        if questionNumber < allQuestions.count {
            print("***questionNumber is \(questionNumber)")
            questionLabel.text = allQuestions[questionNumber].question
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions", preferredStyle: .alert)

            let stop = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(stop)

            present(alert, animated: true, completion: nil)
            startOver()
        }

        let answer = allQuestions[questionNumber].correctAnswer
        let wrong = allQuestions[questionNumber].wrongAnswer

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

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard allQuestions.count > questionNumber else { return }
        let correctAnswer = allQuestions[questionNumber].correctAnswer

        if sender.tag == 1 {
            if button1.currentTitle == correctAnswer {
                print("Correct")
                showCorrectOrWrong(correct: true)
                addToScore()
            } else {
                print("Wrong")
                showCorrectOrWrong(correct: false)
            }
        } else if sender.tag == 2 {
            if button2.currentTitle == correctAnswer {
                showCorrectOrWrong(correct: true)
                print("Correct")
                addToScore()
            } else {
                print("Wrong")
                showCorrectOrWrong(correct: false)
            }
        }
        questionNumber += 1
        print("questionNumber is \(questionNumber)")
        showQuestion()
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        showQuestion()
    }

    func addToScore() {
        score += 1
    }
    
    func showCorrectOrWrong(correct: Bool) {
        let hudView = HudView.hud(inView: view, animated: true)
        if correct {
            hudView.image = UIImage(named: "correct")
            hudView.text = "Correct!"
            hudView.color = UIColor(hue: 0.3306, saturation: 0.56, brightness: 0.77, alpha: 0.8)
        } else {
            hudView.image = UIImage(named: "wrong")
            hudView.text = "Wrong!"
            hudView.color = UIColor(hue: 0, saturation: 0.65, brightness: 1, alpha: 0.8)
        }
        let delayInSeconds = 0.6
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) {
            hudView.hide()
        }
    }
}
