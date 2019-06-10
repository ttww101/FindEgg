//
//  ViewController08.swift
//  FindEgg
//
//  Created by Jack on 2019/6/4.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController08: CommonViewController {
    let gooseImgView = UIImageView(named: "story_chicken_am501")
    let talkBoxImgView = UIImageView(named: "story_chicken_tk401")
    let label = TTLabel.brownDesciptionLabel()
    let breakEggImgView = UIImageView(named: "story_chicken_am502")
    let gooseEggsImgView = UIImageView(named: "story_chicken_eg501")
    var myPlayer :AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        gooseImgView.isHidden = true
        talkBoxImgView.isHidden = true
        label.isHidden = true
        breakEggImgView.isHidden = true
        gooseEggsImgView.isHidden = true
        
        setBgImg(name: "story_chicken_back05", view: view)
        
        gooseImgView.frame = CGRect(x: widthRate(rate: 0.5), y: heightRate(rate: 0.42), width: widthRate(rate: 0.22), height: widthRate(rate: 0.284))
        view.addSubview(gooseImgView)
        
        talkBoxImgView.frame = CGRect(x: widthRate(rate: 0.17), y: heightRate(rate: 0.19), width: widthRate(rate: 0.34), height: widthRate(rate: 0.2))
        view.addSubview(talkBoxImgView)
        
        label.text = "为什么会生出鸡宝宝"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 6
        label.frame = CGRect(x: widthRate(rate: 0.17), y: heightRate(rate: 0.19), width: widthRate(rate: 0.34), height: widthRate(rate: 0.2))
        let centerX = talkBoxImgView.center.x
        let centerY = talkBoxImgView.center.y
        label.center = CGPoint(x: centerX + widthRate(rate: -0.015), y: centerY + heightRate(rate: 0))
        view.addSubview(label)
        
        breakEggImgView.frame = CGRect(x: widthRate(rate: 0.28), y: heightRate(rate: 0.56), width: widthRate(rate: 0.07), height: widthRate(rate: 0.08))
        view.addSubview(breakEggImgView)
        
        gooseEggsImgView.frame = CGRect(x: widthRate(rate: 0.15), y: heightRate(rate: 0.65), width: widthRate(rate: 0.26), height: widthRate(rate: 0.088))
        view.addSubview(gooseEggsImgView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
        let btn = TTButton.previousBtn()
        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
        view.addSubview(btn)
        btn.rx.tap.subscribe(onNext: {
            let vc = ViewController07()
            let viewControllerTransitioning = ViewControllerTransitioning()
            vc.transitioningDelegate = viewControllerTransitioning
            self.present(vc, animated: true, completion: nil)
        })
        
        view.bringSubviewToFront(homeBtn)
        view.bringSubviewToFront(replayBtn)
        view.bringSubviewToFront(previousBtn)
        view.bringSubviewToFront(nextBtn)
    }
    var count = 0
    @objc func tap() {
        if count == 0 {
            
            gooseEggsImgView.isHidden = false
        } else if count == 1 {
            breakEggImgView.isHidden = false
            fadeIn(view: breakEggImgView)
        } else if count == 2 {
            gooseImgView.isHidden = false
            shake(view: gooseImgView)
        } else if count == 3 {
            talkBoxImgView.isHidden = false
            label.isHidden = false
        } else if count == 4 {
            let vc = ViewController09()
            let viewControllerTransitioning = ViewControllerTransitioning()
            vc.transitioningDelegate = viewControllerTransitioning
            self.present(vc, animated: true, completion: nil)
        }
        count += 1
    }
    
}
