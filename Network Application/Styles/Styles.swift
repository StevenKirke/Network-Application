//
//  Styles.swift
//  Network Application
//
//  Created by Steven Kirke on 21.09.2020.
//

import UIKit

class Styles {
    
    func blurImage(image: UIImageView, view: UITableView, style: UIBlurEffect.Style) {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blurView.frame = view.frame
        image.addSubview(blurView)
    }
}
