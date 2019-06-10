//
//  ViewController02.swift
//  FindEgg
//
//  Created by Jack on 2019/6/3.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import AVFoundation

func setBgImg(name: String, view: UIView) {
    let bgImg = UIImage(named: name)
    let bgImgView = UIImageView(image: bgImg)
    bgImgView.frame = view.bounds
    view.addSubview(bgImgView)
}

class ViewController02: CommonViewController, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CommonViewControllerAnimatedTransitioning()
    }
    
    var myPlayer :AVAudioPlayer!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPlayer = player(fileName: "02第一幕音效", type: "mp3")
        myPlayer.play()
        
        setBgImg(name: "story_chicken_back01", view: view)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
        let btn = TTButton.previousBtn()
        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
        view.addSubview(btn)
        btn.rx.tap.subscribe(onNext: {
            let vc = ViewController()
            let viewControllerTransitioning = ViewControllerTransitioning()
            vc.transitioningDelegate = viewControllerTransitioning
            self.present(vc, animated: true, completion: nil)
        })

        view.bringSubviewToFront(homeBtn)
        view.bringSubviewToFront(replayBtn)
        view.bringSubviewToFront(previousBtn)
        view.bringSubviewToFront(nextBtn)
    }
    
    @objc func tap() {
        let centerX = view.center.x
        if count == 0 {
            let label1 = TTLabel.brownDesciptionLabel()
            label1.text = "快乐农场的早晨"
            label1.sizeToFit()
            label1.center = CGPoint(x: centerX, y: 50)
            view.addSubview(label1)
            fadeIn(view: label1)
        } else if count == 1 {
            let label2 = TTLabel.brownDesciptionLabel()
            label2.text = "鸡妈妈照顾许久的蛋"
            label2.sizeToFit()
            label2.center = CGPoint(x: centerX, y: 100)
            view.addSubview(label2)
            fadeIn(view: label2)
        } else if count == 2 {
            let label3 = TTLabel.brownDesciptionLabel()
            label3.text = "终于要孵化了"
            label3.sizeToFit()
            label3.center = CGPoint(x: centerX, y: 150)
            view.addSubview(label3)
            fadeIn(view: label3)
        } else if count == 3 {
            let vc3 = ViewController03()
            vc3.transitioningDelegate = self
            self.present(vc3, animated: true, completion: nil)
        }
        count += 1
    }

}

func fadeIn(view: UIView) {
    view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1);
    
    UIView.animate(withDuration: 1) {
        view.transform = CGAffineTransform(scaleX: 1, y: 1);
    }
}
