//
//  JSONTest.swift
//  JapaneseQuizTests
//
//  Created by Michelle Lau on 2020/06/14.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import XCTest
@testable import JapaneseQuiz

class JSONTest: XCTestCase {

    func testLaunchDecoding() {
//        var wordDataArray = [Word]()
//        var allQuestions = [Question]()
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "UnitTestJSON", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(WordData.self, from: data) else {
            return
        }
        XCTAssertNotNil(decodedData)
//        for i in 0..<decodedData.data.count {
//            let englishWord = decodedData.data[i].senses[0].englishDefinitions[0]
//            let japaneseWord = decodedData.data[i].slug
//            let newWord = Word(japaneseWord: japaneseWord, englishWord: englishWord)
//            wordDataArray.append(newWord)
//
//            var possibleWrongAnswers = [String]()
//            for i in 0..<wordDataArray.count {
//                let englishQuestion = wordDataArray[i].englishWord
//                let japaneseAnswer = wordDataArray[i].japaneseWord
//                var randomNumber: Int?
//                repeat {
//                    randomNumber = Int.random(in: 0..<wordDataArray.count)
//                } while randomNumber == i
//                let wrongAnswer = wordDataArray[randomNumber!].japaneseWord
//                print("wrongAnswer is \(wrongAnswer)")
//                possibleWrongAnswers.append(wrongAnswer)
//                let randomizedWrongAnswer = possibleWrongAnswers[i]
//                let newQuestion = Question(question: englishQuestion, correctAnswer: japaneseAnswer, wrongAnswer: randomizedWrongAnswer)
//                allQuestions.append(newQuestion)
//            }
//        }
//        XCTAssertEqual(allQuestions[0].question, "school")
    }
}
