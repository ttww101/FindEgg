//
//  SettingView.swift
//  FindEgg
//
//  Created by Jack on 2019/6/11.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class SettingView: UIView {
    
    func ind(val: CGFloat) ->CGFloat {
        return widthRate(rate: 0.018 + (0.245-0.018)*val)
    }

    let closeBtn = UIButton()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bgImgView = UIImageView(named: "st_back")
        addSubview(bgImgView)
        bgImgView.bounds.size = bounds.size
        bgImgView.center = center
        backgroundColor = .clear
        closeBtn.frame = CGRect(x: widthRate(rate: 0.63), y: 0, width: widthRate(rate: 0.065), height: widthRate(rate: 0.065))
//        closeBtn.backgroundColor = .yellow
        closeBtn.layer.cornerRadius = closeBtn.frame.size.width / 2
        closeBtn.alpha = 0.5
        addSubview(closeBtn)
        
        let confirmBtn = UIButton()
        confirmBtn.setImage(UIImage(named: "st_bt"), for: .normal)
        addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(heightRate(rate: -0.05))
            let size: CGFloat = 0.16
            make.size.equalTo(CGSize(width: widthRate(rate: size), height: widthRate(rate: size/2)))
        }
        confirmBtn.rx.tap.subscribe(onNext: {
            volume = self.indVal1
            speed = 1/3 + self.indVal2 * (2/3)
            self.isHidden = true
            UserDefaults.standard.set(Double(volume), forKey: "volume")
            UserDefaults.standard.set(Double(speed), forKey: "speed")
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.myPlayer.volume = Float(volume)
        })
        
        let margin: CGFloat = 0.14
        let btnSize: CGFloat = 0.06
        let addBtn1 = UIButton()
        addBtn1.setImage(UIImage(named: "st_m"), for: .normal)
        addSubview(addBtn1)
        addBtn1.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(widthRate(rate: -margin))
            make.top.equalTo(self).offset(heightRate(rate: 0.15))
            make.size.equalTo(CGSize(width: widthRate(rate: btnSize), height: widthRate(rate: btnSize)))
        }
        addBtn1.rx.tap.subscribe(onNext: {
            var tmpIndVal = self.indVal1
            tmpIndVal += self.indScale1
            if tmpIndVal <= 1 && tmpIndVal >= 0 {
                self.indVal1 = tmpIndVal
                self.indConstraint1?.update(offset: self.ind(val: tmpIndVal))
            }
        })

        let addBtn2 = UIButton()
        addBtn2.setImage(UIImage(named: "st_m"), for: .normal)
        addSubview(addBtn2)
        addBtn2.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(widthRate(rate: -margin))
            make.top.equalTo(self).offset(heightRate(rate: 0.36))
            make.size.equalTo(CGSize(width: widthRate(rate: btnSize), height: widthRate(rate: btnSize)))
        }
        addBtn2.rx.tap.subscribe(onNext: {
            var tmpIndVal = self.indVal2
            tmpIndVal += self.indScale2
            if tmpIndVal <= 1 && tmpIndVal >= 0 {
                self.indVal2 = tmpIndVal
                self.indConstraint2?.update(offset: self.ind(val: tmpIndVal))
            }
        })

        let subBtn1 = UIButton()
        subBtn1.setImage(UIImage(named: "st_e"), for: .normal)
        addSubview(subBtn1)
        subBtn1.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(widthRate(rate: margin))
            make.top.equalTo(self).offset(heightRate(rate: 0.15))
            make.size.equalTo(CGSize(width: widthRate(rate: btnSize), height: widthRate(rate: btnSize)))
        }
        subBtn1.rx.tap.subscribe(onNext: {
            var tmpIndVal = self.indVal1
            tmpIndVal -= self.indScale1
            if tmpIndVal <= 1 && tmpIndVal >= 0 {
                self.indVal1 = tmpIndVal
                self.indConstraint1?.update(offset: self.ind(val: tmpIndVal))
            }
        })

        let subBtn2 = UIButton()
        subBtn2.setImage(UIImage(named: "st_e"), for: .normal)
        addSubview(subBtn2)
        subBtn2.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(widthRate(rate: margin))
            make.top.equalTo(self).offset(heightRate(rate: 0.36))
            make.size.equalTo(CGSize(width: widthRate(rate: btnSize), height: widthRate(rate: btnSize)))
        }
        subBtn2.rx.tap.subscribe(onNext: {
            var tmpIndVal = self.indVal2
            tmpIndVal -= self.indScale2
            if tmpIndVal <= 1 && tmpIndVal >= 0 {
                self.indVal2 = tmpIndVal
                self.indConstraint2?.update(offset: self.ind(val: tmpIndVal))
            }
        })

        let indImgView1 = UIImageView(named: "st_p")
        indImgView1.isUserInteractionEnabled = true
        addSubview(indImgView1)
        indImgView1.snp.makeConstraints { (make) in
            make.centerY.equalTo(addBtn1)
            self.indConstraint1 = make.left.equalTo(subBtn1.snp.right).offset(ind(val: volume)).constraint
            make.size.equalTo(CGSize(width: widthRate(rate: 0.03), height: widthRate(rate: 0.0422)))
        }
        let pan1 = UIPanGestureRecognizer(target: self, action: #selector(SettingView.pan(recognizer:)))
        pan1.minimumNumberOfTouches = 1
        pan1.maximumNumberOfTouches = 1
        indImgView1.addGestureRecognizer(pan1)
        let indImgView2 = UIImageView(named: "st_p")
        addSubview(indImgView2)
        indImgView2.snp.makeConstraints { (make) in
            make.centerY.equalTo(addBtn2)
//            make.left.equalTo(addBtn2.snp.right).offset(widthRate(rate: 0.02))
            self.indConstraint2 = make.left.equalTo(subBtn2.snp.right).offset(ind(val: indVal2)).constraint
            make.size.equalTo(CGSize(width: widthRate(rate: 0.03), height: widthRate(rate: 0.0422)))

        }
        indImgView2.isUserInteractionEnabled = true
        let pan2 = UIPanGestureRecognizer(target: self, action: #selector(SettingView.pan2(recognizer:)))
        pan2.minimumNumberOfTouches = 1
        pan2.maximumNumberOfTouches = 1
        indImgView2.addGestureRecognizer(pan2)
        
    }
    @objc func pan(recognizer:UIPanGestureRecognizer) {
        // 設置 UIView 新的位置
        let point = recognizer.location(in: self)
        let x = point.x
        let first = widthRate(rate: 0.018)
        let last = widthRate(rate: 0.245)
        var p = (x - first) / (last - first) - 1
        if p < 0 {
            p = 0
        } else if (p > 1) {
            p = 1
        }
        self.indVal1 = p
        self.indConstraint1?.update(offset: self.ind(val: CGFloat(Int(p / indScale1))*indScale1))
    }
    
    @objc func pan2(recognizer:UIPanGestureRecognizer) {
        // 設置 UIView 新的位置
        let point = recognizer.location(in: self)
        let x = point.x
        let first = widthRate(rate: 0.018)
        let last = widthRate(rate: 0.245)
        var p = (x - first) / (last - first) - 1
        if p < 0 {
            p = 0
        } else if (p > 1) {
            p = 1
        }
        self.indVal2 = p
        self.indConstraint2?.update(offset: self.ind(val: CGFloat(Int(p / indScale2))*indScale2))
    }
    
    var indVal1: CGFloat = 0
    var indVal2: CGFloat = 1
    let indScale1: CGFloat = 0.1
    let indScale2: CGFloat = 1/2
    
    var indConstraint1: Constraint?
    var indConstraint2: Constraint?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

var speed: CGFloat = 1/3
