//
//  TTLabel.swift
//  FindEgg
//
//  Created by Jack on 2019/6/3.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit

class TTLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    static func brownDesciptionLabel() ->UILabel {
        let label = UILabel()
        label.textColor = UIColor(rgb: 0xA40000)
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }
    
    static func whiteTitleLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28)
        return label
    }

}


extension UIColor {
    convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

