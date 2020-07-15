//
//  CreditsViewController.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/07/15.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let attributedString = NSMutableAttributedString(string: "I created my free logo at LogoMakr.com.")
        attributedString.addAttribute(.link, value: "https://www.LogoMakr.com", range: NSRange(location: 24, length: 14))
        textView.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
