//
//  ViewController09.swift
//  FindEgg
//
//  Created by Jack on 2019/6/4.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController09: CommonViewController {
    let teacherImgView = UIImageView(named: "story_chicken_t")
    let henImgView = UIImageView(named: "story_chicken_ck302")
    let eggImgView = UIImageView(named: "story_chicken_eg602")
    let talkBoxImgView = UIImageView(named: "story_chicken_tk601")
    let label = TTLabel.brownDesciptionLabel()
    let gooseEggsImgView = UIImageView(named: "story_chicken_eg501")
    var myPlayer :AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        myPlayer = player(fileName: "18_19_20_21音效", type: "wav")
        teacherImgView.isHidden = true
        henImgView.isHidden = true
        eggImgView.isHidden = true
        talkBoxImgView.isHidden = true
        label.isHidden = true
        gooseEggsImgView.isHidden = true
        setBgImg(name: "story_chicken_back06", view: view)
        
        teacherImgView.frame = CGRect(x: widthRate(rate: 0.02), y: heightRate(rate: 0.3), width: widthRate(rate: 0.25), height: widthRate(rate: 0.424))
        view.addSubview(teacherImgView)
        
        henImgView.frame = CGRect(x: widthRate(rate: 0.32), y: heightRate(rate: 0.29), width: heightRate(rate: 0.11), height: heightRate(rate: 0.14))
        view.addSubview(henImgView)
        
        eggImgView.frame = CGRect(x: widthRate(rate: 0.38), y: heightRate(rate: 0.38), width: heightRate(rate: 0.04), height: heightRate(rate: 0.05))
        view.addSubview(eggImgView)
        
        talkBoxImgView.frame = CGRect(x: widthRate(rate: 0.23), y: heightRate(rate: 0.48), width: heightRate(rate: 0.503), height: heightRate(rate: 0.37))
        view.addSubview(talkBoxImgView)
        
        label.text = "原来\n鸡妈妈早上出门\n不小心踢到了蛋\n蛋就滚到了鹅妈妈的家"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 6
        label.textAlignment = .center
        label.frame = CGRect(x: widthRate(rate: 0.23), y: heightRate(rate: 0.48), width: heightRate(rate: 0.503), height: heightRate(rate: 0.37))
        let centerX = talkBoxImgView.center.x
        let centerY = talkBoxImgView.center.y
        label.center = CGPoint(x: centerX + widthRate(rate: 0), y: centerY + heightRate(rate: -0.03))
        view.addSubview(label)
        
        gooseEggsImgView.frame = CGRect(x: widthRate(rate: 0.61), y: heightRate(rate: 0.59), width: widthRate(rate: 0.1), height: widthRate(rate: 0.037))
        view.addSubview(gooseEggsImgView)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
//        let btn = TTButton.previousBtn()
//        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
//        view.addSubview(btn)
//        btn.rx.tap.subscribe(onNext: {
//            let vc = ViewController08()
//            let viewControllerTransitioning = ViewControllerTransitioning()
//            vc.transitioningDelegate = viewControllerTransitioning
//            self.present(vc, animated: true, completion: nil)
//        })
        
        view.bringSubviewToFront(homeBtn)
        view.bringSubviewToFront(replayBtn)
        view.bringSubviewToFront(previousBtn)
        view.bringSubviewToFront(nextBtn)
    }
    
    var count = 0
    @objc func tap() {
        if count == 0 {
            teacherImgView.isHidden = false
        } else if count == 1 {
            talkBoxImgView.isHidden = false
            label.isHidden = false
        } else if count == 2 {
            henImgView.isHidden = false
//            shake(view: henImgView)
            eggImgView.isHidden = false
            gooseEggsImgView.isHidden = false
        } else if count == 3 {
            UIView.animate(withDuration: 1/TimeInterval(speed*3), animations: {
                self.eggImgView.frame = CGRect(x: widthRate(rate: 0.66), y: heightRate(rate: 0.57), width: heightRate(rate: 0.05), height: heightRate(rate: 0.04))
                let animation = CABasicAnimation(keyPath: "transform.rotation.z")
                animation.fromValue = NSNumber(value: 0)
                animation.toValue = NSNumber(value: Float.pi * 2)
                animation.duration = 0.2
                animation.autoreverses = false
                animation.repeatCount = MAXFLOAT
                animation.fillMode = .forwards
                self.eggImgView.layer.add(animation, forKey: nil)
            }) { (sussessed) in
                self.eggImgView.layer.removeAllAnimations()
            }
            
            label.text = "这个事件真是\n太乌龙了"
        } else if count == 4 {
            label.text = "小朋友\n我们做事都要小心\n不要踢到东西"
        } else if count == 5 {
            let vc = ViewController10()
            let viewControllerTransitioning = ViewController10()
            vc.transitioningDelegate = viewControllerTransitioning
            self.present(vc, animated: true, completion: nil)
        }
        count += 1
    }

}
