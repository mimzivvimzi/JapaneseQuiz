//
//  ViewController+Constraints.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/05/18.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import UIKit
import SnapKit

extension JLPT5ViewController {
    
    func setUpConstraints() {
        
        beginningOfQuestion.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        
        questionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(beginningOfQuestion).offset(70)
            make.leading.trailing.equalTo(beginningOfQuestion)
            make.centerX.equalToSuperview()
        }
        
        button1.snp.makeConstraints { (make) in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-140)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
        
        button2.snp.makeConstraints { (make) in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-140)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-30)
            make.leading.equalToSuperview().offset(30)
        }
        
    }
    
}

extension JLPT1ViewController {
    
    func setUpConstraints() {
        
        beginningOfQuestion.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        
        questionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(beginningOfQuestion).offset(70)
            make.leading.trailing.equalTo(beginningOfQuestion)
            make.centerX.equalToSuperview()
        }
        
        button1.snp.makeConstraints { (make) in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-140)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
        
        button2.snp.makeConstraints { (make) in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-140)
            make.width.equalTo(110)
            make.height.equalTo(80)
        }
        
        scoreLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-30)
            make.leading.equalToSuperview().offset(30)
        }
        
    }
    
}
