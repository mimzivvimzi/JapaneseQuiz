//
//  activityIndicator.swift
//  JapaneseQuiz
//
//  Created by Michelle Lau on 2020/07/04.
//  Copyright © 2020 Michelle Lau. All rights reserved.
//

import UIKit

func showActivityIndicatory(actInd: UIActivityIndicatorView, uiView: UIView) {
    actInd.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
    actInd.center = uiView.center
    actInd.hidesWhenStopped = true
    actInd.style =
        UIActivityIndicatorView.Style.large
    uiView.addSubview(actInd)
    actInd.startAnimating()
}
