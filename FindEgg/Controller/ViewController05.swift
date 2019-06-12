//
//  ViewController05.swift
//  FindEgg
//
//  Created by Jack on 2019/6/3.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController05: CommonViewController {
    let henImgView = UIImageView(named: "story_chicken_ck301")
    let talkBoxImgView = UIImageView(named: "story_chicken_tk301")
    let label = TTLabel.brownDesciptionLabel()
    let magnifierImgView = UIImageView(named: "story_chicken_f")
    var myPlayer :AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        henImgView.isHidden = true
        talkBoxImgView.isHidden = true
        label.isHidden = true
        magnifierImgView.isHidden = true
        
        setBgImg(name: "story_chicken_back03", view: view)
        
        henImgView.frame = CGRect(x: widthRate(rate: 0.38), y: heightRate(rate: 0.3), width: widthRate(rate: 0.31), height: widthRate(rate: 0.369))
        view.addSubview(henImgView)
        
        talkBoxImgView.frame = CGRect(x: widthRate(rate: 0.65), y: heightRate(rate: 0.05), width: heightRate(rate: 0.396), height: heightRate(rate: 0.4))
        view.addSubview(talkBoxImgView)
        
        label.text = "我要找出\n可恶的偷蛋贼"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 6
        label.frame = CGRect(x: widthRate(rate: 0.65), y: heightRate(rate: 0.05), width: heightRate(rate: 0.396), height: heightRate(rate: 0.4))
        view.addSubview(label)
        
        magnifierImgView.frame = CGRect(x: widthRate(rate: 0.084), y: heightRate(rate: 0.32), width: widthRate(rate: 0.28), height: widthRate(rate: 0.252))
        view.addSubview(magnifierImgView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
//        let btn = TTButton.previousBtn()
//        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
//        view.addSubview(btn)
//        btn.rx.tap.subscribe(onNext: {
//            let vc = ViewController04()
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
            henImgView.isHidden = false
            henImgView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1);
            
            UIView.animate(withDuration: 1/TimeInterval(speed*3), animations: {
                self.henImgView.transform = CGAffineTransform(scaleX: 1, y: 1);
            }) { (success) in
                shake(view: self.henImgView)
            }
        } else if count == 1 {
            talkBoxImgView.isHidden = false
            label.isHidden = false
            myPlayer = player(fileName: "06", type: "wav")
        } else if count == 2 {
            magnifierImgView.isHidden = false
            let r = widthRate(rate: 0.02)
            func pos(p: CGPoint, r: CGFloat, i: CGFloat) -> CGPoint {
                return CGPoint(x: p.x + sin(i * 2 * CGFloat.pi)*r, y: p.y + cos(i * 2 * CGFloat.pi)*r)
            }
            let time = 0.1
            for i in 0..<30 {
                UIView.animate(withDuration: time/TimeInterval(speed*3), delay: TimeInterval(i)*time/TimeInterval(speed*3), options: [], animations: {
                    self.magnifierImgView.center = pos(p: self.magnifierImgView.center, r: widthRate(rate: 0.01), i: -CGFloat(0.1*Double(i)))
                }) { (s) in
                    
                }
            }

        } else if count == 3 {
            let vc = ViewController06()
            let viewControllerTransitioning = ViewControllerTransitioning()
            vc.transitioningDelegate = viewControllerTransitioning
            self.present(vc, animated: true, completion: nil)
        }
        count += 1
    }
    
}
