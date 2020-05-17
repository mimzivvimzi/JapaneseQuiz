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
    var score = -1 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
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
        score = 0
        
        //Why are you doing an asyncTask here? I dont understand the logic here. Please talk to me on monday so that we can fix this. This is causing something known as a race condition which is creating crashes.
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
//            for i in 0..<self.allQuestions.count {
//                self.showQuestion()
//            }
//        })
    }
    
    func makeAPICall() {
        let url = URL(string: "https://jisho.org/api/v1/search/words?keyword=%23jlpt-n4")!
        AF.request(url).validate().responseJSON { (response) in
            switch response.result {
            case .success(_):
                //Here you used if. if you replace the condition with false you will realize that the code will fail when you click on any button. to solve this replace with guard
                //The guard statement will make sure that the value is not nil, if it was it will exit the code instead of continuing
                guard let value = response.value else { return }
                    let json = JSON(value)
                    let dataBranch = json["data"]
//                    print(json)
                //Here, instead of decoding json like that, create a new model that can do it for you, and you simply give it the json. I will show you this later as well if you wish
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
        //here the questionNumber will not count the last question
        /*
         consider we have 5 questions the condition is that questionNumber < allQuestions.count - 1 so less than 4
         question number will only be 0, 1, 2, and 3 thus leaving the last question.
         */
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

    /*
     Instead of having 2 functions that do the same, you can combine them in one function by giving them a tag.
     you can set a the story board and here you simply check the tag if needed. but based on the code i dont think you need tags, they are running the same exact code here
     */
    @IBAction func button1Pressed(_ sender: UIButton) {
        //In here, if the questionNumber is greater than allQuestions it will crash. this will happen if the previous gaurd statement returned instead of executing
        //to solve it we need to check if the questionNumber is less than allQuestion.count
        guard allQuestions.count > questionNumber else { return }
        let correctAnswer = allQuestions[questionNumber].correctAnswer
        //this works fine comparing the text, but i suggest you compare indices instead, when you are setting the right and wrong value, keep a global variable that tells you which index is right, and using the tag that i mentioned before, you can compare them. comparing integers is much more safer than comapring strings.
        if button1.currentTitle == correctAnswer {
            print("Correct")
            addToScore()
//            updateUI()
        } else {
            print("Wrong")
        }
        questionNumber += 1
        print("questionNumber is \(questionNumber)")
        showQuestion()
    }

    @IBAction func button2Pressed(_ sender: UIButton) {
        guard allQuestions.count > questionNumber else { return }
        let correctAnswer = allQuestions[questionNumber].correctAnswer
        if button2.currentTitle == correctAnswer {
            print("Correct!")
            addToScore()
//            updateUI()
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

    //this function only has 1 line of code, and it is called in 3 places. to fix this, make the score a dynamic value as seen above.
//    func updateUI() {
//        scoreLabel.text = "Score: \(score)"
//    }


}

