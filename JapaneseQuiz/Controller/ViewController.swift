//
//  ViewController.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/05/14.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    var questionNumber = 0
    var randomNumberForCorrectAnswer: Int?
    var randomNumberForWrongAnswer: Int?
    var score = 0
    
    var allQuestions = [Question]()
    var myWordArray = [Word]()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 20
        button2.layer.cornerRadius = 20
        self.view.backgroundColor = #colorLiteral(red: 0.9681944251, green: 0.8723551035, blue: 0.958781302, alpha: 0.8176637414)
        makeAPICall()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            for i in 0..<self.allQuestions.count {
                self.showQuestion()
            }
        })
    }
    
    func makeAPICall() {
        let url = URL(string: "https://jisho.org/api/v1/search/words?keyword=%23jlpt-n4")!
        AF.request(url).validate().responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let value = response.value {
                    let json = JSON(value)
                    let dataBranch = json["data"]
//                    print(json)
                    for i in 0..<dataBranch.count {
                        let japaneseWord = json["data"][i]["japanese"][0]["word"].stringValue
                        let englishWord = json["data"][i]["senses"][0]["english_definitions"][0].stringValue
                        print(japaneseWord)
                        print(englishWord)
                        let myWord = Word(japaneseWord: japaneseWord, englishWord: englishWord)
                        self.myWordArray.append(myWord)
                        print("myWordArray is \(self.myWordArray)")
//                        print(dataBranch.count)
                    }
                }
                var possibleWrongAnswers = [String]()
                for i in 0..<self.myWordArray.count {
                    let englishQuestion = self.myWordArray[i].englishWord
                    print("englishQuestion is \(englishQuestion)")
                    let correctAnswer = self.myWordArray[i].japaneseWord
                    print("correctAnswer is \(correctAnswer)")
                    let randomNumber = Int.random(in: 0..<self.myWordArray.count)
                    let test = self.myWordArray[randomNumber].japaneseWord
                    print("test is \(test)")
                    if test == correctAnswer {
                        continue
                    } else {
                        possibleWrongAnswers.append(test)
                        let randomizedWrongAnswer = possibleWrongAnswers.randomElement()
                        let newQuestion = Question(question: englishQuestion, correctAnswer: correctAnswer, wrongAnswer: randomizedWrongAnswer ?? "")
                        self.allQuestions.append(newQuestion)
                        print("englishQuestion is \(englishQuestion), correctAnswer is \(correctAnswer), and randomizedWrongAnswer is \(randomizedWrongAnswer!) \n")
                        print(self.allQuestions.count)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func showQuestion() {
        if questionNumber < allQuestions.count-1 {
            print("***questionNumber is \(questionNumber)")
            questionLabel.text = allQuestions[questionNumber].question
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions", preferredStyle: .alert)

            let stop = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(stop)

            present(alert, animated: true, completion: nil)
            startOver()
            updateUI()
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

    @IBAction func button1Pressed(_ sender: UIButton) {
        let correctAnswer = allQuestions[questionNumber].correctAnswer
        if button1.currentTitle == correctAnswer {
            print("Correct")
            addToScore()
            updateUI()
        } else {
            print("Wrong")
        }
        questionNumber += 1
        print("questionNumber is \(questionNumber)")
        showQuestion()
    }

    @IBAction func button2Pressed(_ sender: UIButton) {
        let correctAnswer = allQuestions[questionNumber].correctAnswer
        if button2.currentTitle == correctAnswer {
            print("Correct!")
            addToScore()
            updateUI()
        } else {
            print("Wrong!")
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

    func updateUI() {
        scoreLabel.text = "Score: \(score)"
    }


}

