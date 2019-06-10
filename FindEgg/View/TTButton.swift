//
//  TTButton.swift
//  FindEgg
//
//  Created by Jack on 2019/6/3.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit

class TTButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    static func startBtn() -> UIButton {
        let btn = UIButton()
        btn.setTitle("故事开始", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor(rgb: 0xffa800)
        btn.layer.borderColor = UIColor(rgb: 0xffa800).cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 15
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        btn.sizeToFit()
        btn.frame = btn.frame.insetBy(dx: -15, dy: -2)
        return btn;
    }
    
    static func previousBtn() -> UIButton {
        let btn = UIButton()
        btn.setTitle("上一頁", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = UIColor(rgb: 0xffa800)
        btn.layer.borderColor = UIColor(rgb: 0xffa800).cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 15
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        btn.sizeToFit()
        btn.frame = btn.frame.insetBy(dx: -15, dy: -2)
        return btn;
    }
    

}
