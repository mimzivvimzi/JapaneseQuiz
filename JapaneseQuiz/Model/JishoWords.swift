//
//  JishoWords.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/05/15.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import Foundation
import SwiftyJSON

class Word {
    var japaneseWord: String
    var englishWord: String
    
    init(japaneseWord: String, englishWord: String) {
        self.japaneseWord = japaneseWord
        self.englishWord = englishWord
    }
}
