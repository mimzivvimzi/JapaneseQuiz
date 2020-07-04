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
    
    func test_decoded_data() {
        
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
        
        let firstElement = decodedData.data[0].slug

        XCTAssertEqual(firstElement, "学校")
    }
}
