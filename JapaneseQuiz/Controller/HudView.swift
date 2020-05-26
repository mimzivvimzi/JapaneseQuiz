//
//  HudView.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/05/26.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import UIKit

class HudView: UIView {
    var text = ""
    var image : UIImage?
    
    class func hud(inView view: UIView, animated: Bool) -> HudView {
        let hudView = HudView(frame: view.bounds)
        hudView.isOpaque = false
        
        view.addSubview(hudView)
        view.isUserInteractionEnabled = false
        
//        hudView.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
        hudView.show(animated: true)
        return hudView
    }
    
    override func draw(_ rect: CGRect) {
        let boxWidth: CGFloat = 120
        let boxHeight: CGFloat = 120
        
        let boxRect = CGRect(
            x: round((bounds.size.width - boxWidth) / 2),
            y: round((bounds.size.height - boxWidth) / 2),
            width: boxWidth,
            height: boxHeight)
        
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 20)
        UIColor(white: 0.5, alpha: 0.8).setFill()
        roundedRect.fill()
        
        // DRAW CHECKMARK
        if let image = self.image {
            let imagePoint = CGPoint(x: center.x - round(image.size.width / 2), y: center.y - round(image.size.height / 2) - boxHeight / 8)
            image.draw(at: imagePoint)
        }
        // DRAW THE TEXT
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
        let textSize = text.size(withAttributes: attributes)
        let textPoint = CGPoint(x: center.x - round(textSize.width / 2), y: center.y - round(textSize.height / 2) + boxHeight / 5)
        text.draw(at: textPoint, withAttributes: attributes)
    }
    
    //MARK: - Public Methods
    func show(animated: Bool) {
        if animated {
            alpha = 0
            transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.7, options: [], animations: {
                self.alpha = 1
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }
    
    func hide() {
        superview?.isUserInteractionEnabled = true
        removeFromSuperview()
    }
}

