//
//  ViewController04.swift
//  FindEgg
//
//  Created by Jack on 2019/6/3.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController04: CommonViewController {
    let henImgView = UIImageView(named: "story_chicken_ck202")
    let talkBoxImgView = UIImageView(named: "story_chicken_tk202")
    let label = TTLabel.brownDesciptionLabel()
    let eggsImgView = UIImageView(named: "story_chicken_eg202")
    let missEggsImgView = UIImageView(named: "story_chicken_neg")
    
    var myPlayer :AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBgImg(name: "story_chicken_back02", view: view)
        henImgView.isHidden = true
        talkBoxImgView.isHidden = true
        label.isHidden = true
        eggsImgView.isHidden = true
        missEggsImgView.isHidden = true
        
        henImgView.frame = CGRect(x: widthRate(rate: 0.54), y: heightRate(rate: 0.01), width: widthRate(rate: 0.43), height: widthRate(rate: 0.518))
        view.addSubview(henImgView)
        
        talkBoxImgView.frame = CGRect(x: widthRate(rate: 0.22), y: heightRate(rate: 0.02), width: heightRate(rate: 0.553), height: heightRate(rate: 0.7))
        view.addSubview(talkBoxImgView)
        
        label.text = "谁\n偷\n了\n我\n的\n蛋"
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 6
        label.frame = CGRect(x: widthRate(rate: 0.35), y: heightRate(rate: 0.06), width: widthRate(rate: 0.42), height: widthRate(rate: 0.35))
        view.addSubview(label)
        
        eggsImgView.frame = CGRect(x: widthRate(rate: 0.21), y: heightRate(rate: 0.7), width: widthRate(rate: 0.47), height: widthRate(rate: 0.176))
        view.addSubview(eggsImgView)
        
        
        missEggsImgView.frame = CGRect(x: widthRate(rate: 0.4), y: heightRate(rate: 0.75), width: widthRate(rate: 0.08), height: widthRate(rate: 0.0926))
        view.addSubview(missEggsImgView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
//        let btn = TTButton.previousBtn()
//        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
//        view.addSubview(btn)
//        btn.rx.tap.subscribe(onNext: {
//            let vc3 = ViewController03()
//            let t = ViewController02()
//            vc3.transitioningDelegate = t
//            self.present(vc3, animated: true, completion: nil)
//        })
        
        view.bringSubviewToFront(homeBtn)
        view.bringSubviewToFront(replayBtn)
        view.bringSubviewToFront(previousBtn)
        view.bringSubviewToFront(nextBtn)
    }
    
    var count = 0
    @objc func tap() {
        if count == 0 {
            eggsImgView.isHidden = false
            missEggsImgView.isHidden = false
        } else if count == 1 {
            henImgView.isHidden = false
            henImgView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1);
            UIView.animate(withDuration: 1, animations: {
                self.henImgView.transform = CGAffineTransform(scaleX: 1, y: 1);
            }) { (success) in
                shake(view: self.henImgView)
            }
        } else if count == 2 {
            myPlayer = player(fileName: "05音效", type: "mp3")
            myPlayer.play()
            talkBoxImgView.isHidden = false
            label.isHidden = false
        } else if count == 3 {
            let vc = ViewController05()
            let viewControllerTransitioning = ViewControllerTransitioning()
            vc.transitioningDelegate = viewControllerTransitioning
            self.present(vc, animated: true, completion: nil)
        }
        count += 1
    }
    
}
