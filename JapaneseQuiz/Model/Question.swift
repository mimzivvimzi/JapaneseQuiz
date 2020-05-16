//
//  Question.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/05/14.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import Foundation


class Question {
    
    let question: String
    let correctAnswer: String
    let wrongAnswer: String
    
    init(question: String, correctAnswer: String, wrongAnswer: String) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.wrongAnswer = wrongAnswer
    }
    
}
