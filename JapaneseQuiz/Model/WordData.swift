//
//  WordData.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/06/14.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import Foundation

struct WordData: Codable {
    let data: [Data]
    
    struct Data: Codable {
        let slug: String
        let senses: [Senses]
    }
    
    struct Senses: Codable {
        let englishDefinitions: [String]

        private enum CodingKeys: String, CodingKey {
            case englishDefinitions = "english_definitions"
        }
    }
}
