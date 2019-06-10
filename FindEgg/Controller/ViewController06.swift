//
//  ViewController06.swift
//  FindEgg
//
//  Created by Jack on 2019/6/4.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController06: CommonViewController {
    
    var animalImgName = "story_chicken_am301"
    var isHenTalk = true
    var talkContent = "驴小弟\n你有看到我蛋吗"
    
    let henImgView = UIImageView(named: "story_chicken_ck302")
    let label = TTLabel.brownDesciptionLabel()
    var talkBoxImgView = UIImageView()
    var animalImgView = UIImageView()
    var myPlayer :AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBgImg(name: "story_chicken_back03", view: view)
        
        henImgView.frame = CGRect(x: widthRate(rate: 0.15), y: heightRate(rate: 0.5), width: widthRate(rate: 0.16), height: widthRate(rate: 0.205))
        view.addSubview(henImgView)
        
        talkBoxImgView = UIImageView(named: "story_chicken_tk30" + (isHenTalk ? "2" : "3"))
        talkBoxImgView.frame = CGRect(x: widthRate(rate: 0.32), y: heightRate(rate: 0.37), width: heightRate(rate: 0.503), height: heightRate(rate: 0.37))
        
        view.addSubview(talkBoxImgView)
        
        label.text = talkContent
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 6
        label.textAlignment = .center
        label.frame = CGRect(x: widthRate(rate: 0.31), y: heightRate(rate: 0.37), width: heightRate(rate: 0.503), height: heightRate(rate: 0.37))
        let centerX = talkBoxImgView.center.x
        let centerY = talkBoxImgView.center.y
        if isHenTalk {
            label.center = CGPoint(x: centerX + widthRate(rate: 0.01), y: centerY - heightRate(rate: 0.02))
        } else {
            label.center = CGPoint(x: centerX - widthRate(rate: 0.01), y: centerY + heightRate(rate: 0.02))
        }
        
        view.addSubview(label)
        
        animalImgView = UIImageView(named: animalImgName)
        animalImgView.frame = CGRect(x: widthRate(rate: 0.62), y: heightRate(rate: 0.5), width: widthRate(rate: 0.2), height: widthRate(rate: 0.2))
        view.addSubview(animalImgView)
        
        henImgView.isHidden = true
        label.isHidden = true
        talkBoxImgView.isHidden = true
        animalImgView.isHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
//        let btn = TTButton.previousBtn()
//        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
//        view.addSubview(btn)
//        btn.rx.tap.subscribe(onNext: {
//            let vc = ViewController05()
//            let viewControllerTransitioning = ViewControllerTransitioning()
//            vc.transitioningDelegate = viewControllerTransitioning
//            self.present(vc, animated: true, completion: nil)
//        })
        
        view.bringSubviewToFront(homeBtn)
        view.bringSubviewToFront(replayBtn)
        view.bringSubviewToFront(previousBtn)
        view.bringSubviewToFront(nextBtn)
    }
    
    var pageCount = 0
    var count = 0
    
    @objc func tap() {
        if count == 0 {
            henImgView.isHidden = false
            self.henImgView.transform = CGAffineTransform(translationX: widthRate(rate:-0.5), y: 0)
            
            UIView.animate(withDuration: 1, animations: {
                self.henImgView.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                shake(view: self.henImgView)
            }
            count = 1
        } else if count == 1 {
            if pageCount == 4 {
                let time: TimeInterval = 1
                let delayTime: TimeInterval = 0.2
                let wr = [0.3, 0.2, 0.3, 0.1, 0.2, 0]
                var animations: [UIViewPropertyAnimator] = []
                
                
                for (index, i) in wr.enumerated() {
                    let animation = UIViewPropertyAnimator(duration: time, curve: .linear, animations: {
                        self.henImgView.transform = CGAffineTransform(translationX: widthRate(rate: CGFloat(i)), y: heightRate(rate: -0))
//                        shake(view: self.henImgView, time: 1)
                    })
                    let momAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
                    momAnimation.fromValue = NSNumber(value: -0.01) //左幅度
                    momAnimation.toValue = NSNumber(value: 0.01) //右幅度
                    momAnimation.duration = 0.1
                    momAnimation.repeatCount = 36 //无限重复
                    momAnimation.autoreverses = true //动画结束时执行逆动画
                    henImgView.layer.add(momAnimation, forKey: "centerLayer")
                    animation.startAnimation(afterDelay: 1.2 * Double(index))
                    animations.append(animation)
                    
                }
                
            }
            
            animalImgView.isHidden = false
            self.animalImgView.transform = CGAffineTransform(translationX: widthRate(rate:0.5), y: 0)
            var time: TimeInterval = 0
            if pageCount == 5 {
                time = 2
            } else {
                time = 1
            }
            UIView.animate(withDuration: time, animations: {
                self.animalImgView.transform = CGAffineTransform(translationX: 0, y: 0)
            }) { (success) in
                shake(view: self.animalImgView)
            }
            count = 2
        } else if count == 2 {
            label.isHidden = false
            talkBoxImgView.isHidden = false
            count = 3
        } else if count == 3 {
            if pageCount == 0 {
                let vc = ViewController06()
                vc.animalImgName = "story_chicken_am301"
                vc.isHenTalk = false
                vc.talkContent = "我早上在广场散步\n没有看到你的蛋"
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                vc.pageCount = pageCount + 1
                self.present(vc, animated: true, completion: nil)
                vc.count = 2
                vc.henImgView.isHidden = false
                vc.animalImgView.isHidden = false
                
            } else if pageCount == 1 {
                let vc = ViewController06()
                vc.animalImgName = "story_chicken_am302"
                vc.isHenTalk = true
                vc.talkContent = "羊驼妹妹\n你有看到我的蛋吗"
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                vc.pageCount = pageCount + 1
                self.present(vc, animated: true, completion: nil)
            } else if pageCount == 2 {
                let vc = ViewController06()
                vc.animalImgName = "story_chicken_am302"
                vc.isHenTalk = false
                vc.talkContent = "我早上在整理我的毛\n我没看到你的蛋"
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                vc.pageCount = pageCount + 1
                self.present(vc, animated: true, completion: nil)
                vc.count = 2
                vc.henImgView.isHidden = false
                vc.animalImgView.isHidden = false
            } else if pageCount == 3 {
                let vc = ViewController06()
                vc.animalImgName = "story_chicken_am30"
                vc.isHenTalk = true
                vc.talkContent = "有谁看到我的蛋\n来帮帮我的忙吧"
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                vc.pageCount = pageCount + 1
                self.present(vc, animated: true, completion: nil)
            } else if pageCount == 4 {
                let vc = ViewController06()
                vc.animalImgName = "story_chicken_am303"
                vc.isHenTalk = false
                vc.talkContent = "鸡妈妈\n你要去围墙外\n问问蛇大哥吗\n他可能把蛋吃了"
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                vc.pageCount = pageCount + 1
                self.present(vc, animated: true, completion: nil)
            } else if pageCount == 5 {
                let vc = BlackViewController()
                vc.label.text = "鸡妈妈\n急忙得跑到围墙外找蛇大哥"
                vc.vc = ViewController07()
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                self.present(vc, animated: true, completion: nil)
            }
            pageCount += 1
            
        }
        
    }
    
    
    
    
}
