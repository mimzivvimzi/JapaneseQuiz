//
//  QuestionBank.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/05/14.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var questionList = [Question]()
    
    init() {
        questionList.append(Question(question: "bad", correctAnswer: "悪い", wrongAnswer: "低い"))
        questionList.append(Question(question: "low", correctAnswer: "低い", wrongAnswer: "古い"))
        questionList.append(Question(question: "famous", correctAnswer: "有名", wrongAnswer: "新しい"))
        questionList.append(Question(question: "new", correctAnswer: "新しい", wrongAnswer: "悪い"))
        questionList.append(Question(question: "old", correctAnswer: "古い", wrongAnswer: "有名"))
        questionList.append(Question(question: "quiet", correctAnswer: "静か", wrongAnswer: "新しい"))

    }
    
}
