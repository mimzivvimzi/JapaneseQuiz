//
//  PerformAPICall.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/06/14.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import Foundation

func performRequest(with urlString: String) {
    if let url = URL(string: urlString) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                _ = parseJSON(safeData)
            }
        }
        task.resume()
    }
}

func parseJSON(_ data: Data) {
    let decoder = JSONDecoder()
    var wordDataArray = [Word]()
    var allQuestions = [Question]()
    do {
        let decodedData = try decoder.decode(WordData.self, from: data)
        for i in 0..<decodedData.data.count {
            let englishWord = decodedData.data[i].senses[0].englishDefinitions[0]
            let japaneseWord = decodedData.data[i].slug
            let newWord = Word(japaneseWord: japaneseWord, englishWord: englishWord)
            wordDataArray.append(newWord)
            
            var possibleWrongAnswers = [String]()
            for i in 0..<wordDataArray.count {
                let englishQuestion = wordDataArray[i].englishWord
                let japaneseAnswer = wordDataArray[i].japaneseWord
                var randomNumber: Int?
                repeat {
                    randomNumber = Int.random(in: 0..<wordDataArray.count)
                } while randomNumber == i
                let wrongAnswer = wordDataArray[randomNumber!].japaneseWord
                print("wrongAnswer is \(wrongAnswer)")
                possibleWrongAnswers.append(wrongAnswer)
                let randomizedWrongAnswer = possibleWrongAnswers[i]
                let newQuestion = Question(question: englishQuestion, correctAnswer: japaneseAnswer, wrongAnswer: randomizedWrongAnswer)
                allQuestions.append(newQuestion)
            }
        }
    } catch {
        print(error)
    }
}

