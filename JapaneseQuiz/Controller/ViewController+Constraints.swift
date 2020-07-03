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
        
        beginningOfQuestion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        beginningOfQuestion.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
        beginningOfQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        beginningOfQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        beginningOfQuestion.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        questionLabel.topAnchor.constraint(equalTo: beginningOfQuestion.bottomAnchor, constant: 70),
        questionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
        questionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        questionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])

        button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        button1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
        button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button1.widthAnchor.constraint(equalToConstant: 110),
        button1.heightAnchor.constraint(equalToConstant: 80)
        ])

        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button2.widthAnchor.constraint(equalToConstant: 110),
        button2.heightAnchor.constraint(equalToConstant: 80)
        ])

        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        scoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        scoreLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
}

extension JLPT4ViewController {
    
    func setUpConstraints() {
        
        beginningOfQuestion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        beginningOfQuestion.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
        beginningOfQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        beginningOfQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        beginningOfQuestion.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        questionLabel.topAnchor.constraint(equalTo: beginningOfQuestion.bottomAnchor, constant: 70),
        questionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
        questionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        questionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])

        button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        button1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
        button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button1.widthAnchor.constraint(equalToConstant: 110),
        button1.heightAnchor.constraint(equalToConstant: 80)
        ])

        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button2.widthAnchor.constraint(equalToConstant: 110),
        button2.heightAnchor.constraint(equalToConstant: 80)
        ])

        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        scoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        scoreLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
}

extension JLPT3ViewController {
    
    func setUpConstraints() {
        
        beginningOfQuestion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        beginningOfQuestion.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
        beginningOfQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        beginningOfQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        beginningOfQuestion.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        questionLabel.topAnchor.constraint(equalTo: beginningOfQuestion.bottomAnchor, constant: 70),
        questionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
        questionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        questionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])

        button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        button1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
        button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button1.widthAnchor.constraint(equalToConstant: 110),
        button1.heightAnchor.constraint(equalToConstant: 80)
        ])

        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button2.widthAnchor.constraint(equalToConstant: 110),
        button2.heightAnchor.constraint(equalToConstant: 80)
        ])

        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        scoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        scoreLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
}

extension JLPT2ViewController {
    
    func setUpConstraints() {
        
        beginningOfQuestion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        beginningOfQuestion.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
        beginningOfQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        beginningOfQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        beginningOfQuestion.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        questionLabel.topAnchor.constraint(equalTo: beginningOfQuestion.bottomAnchor, constant: 70),
        questionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
        questionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        questionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])

        button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        button1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
        button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button1.widthAnchor.constraint(equalToConstant: 110),
        button1.heightAnchor.constraint(equalToConstant: 80)
        ])

        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button2.widthAnchor.constraint(equalToConstant: 110),
        button2.heightAnchor.constraint(equalToConstant: 80)
        ])

        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        scoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        scoreLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
}

extension JLPT1ViewController {
    
    func setUpConstraints() {
        
        beginningOfQuestion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        beginningOfQuestion.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
        beginningOfQuestion.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        beginningOfQuestion.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        beginningOfQuestion.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        questionLabel.topAnchor.constraint(equalTo: beginningOfQuestion.bottomAnchor, constant: 70),
        questionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
        questionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        questionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])

        button1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        button1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
        button1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button1.widthAnchor.constraint(equalToConstant: 110),
        button1.heightAnchor.constraint(equalToConstant: 80)
        ])

        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
        button2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
        button2.widthAnchor.constraint(equalToConstant: 110),
        button2.heightAnchor.constraint(equalToConstant: 80)
        ])

        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        scoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        scoreLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        ])
    }
}
