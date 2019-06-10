//
//  ViewController03.swift
//  FindEgg
//
//  Created by Jack on 2019/6/3.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

extension UIImageView {
    convenience init(named: String) {
        self.init(image: UIImage(named: named))
    }
}


let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

func widthRate(rate: CGFloat) -> CGFloat {
    return width * rate
}

func heightRate(rate: CGFloat) -> CGFloat {
    return height * rate
}



class ViewController03: CommonViewController {
    var myPlayer = AVAudioPlayer()
    let henImgView = UIImageView(named: "story_chicken_ck201")
    let talkBoxImgView = UIImageView(named: "story_chicken_tk201")
    let label = TTLabel.brownDesciptionLabel()
    let eggsImgView = UIImageView(named: "story_chicken_eg201")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBgImg(name: "story_chicken_back02", view: view)
        
        henImgView.frame = CGRect(x: widthRate(rate: 0.13), y: heightRate(rate: 0.23), width: widthRate(rate: 0.44), height: widthRate(rate: 0.425))
        view.addSubview(henImgView)
        henImgView.isHidden = true
        
        talkBoxImgView.frame = CGRect(x: widthRate(rate: 0.45), y: heightRate(rate: 0.06), width: widthRate(rate: 0.42), height: widthRate(rate: 0.297))
        view.addSubview(talkBoxImgView)
        talkBoxImgView.isHidden = true
        
        label.text = "照顾好久好不容易\n七颗蛋快孵出来了\n我去休息一下"
        label.numberOfLines = 3
        label.frame = CGRect(x: widthRate(rate: 0.55), y: heightRate(rate: 0.06), width: widthRate(rate: 0.42), height: widthRate(rate: 0.297))
        view.addSubview(label)
        label.isHidden = true
        
        eggsImgView.frame = CGRect(x: widthRate(rate: 0.21), y: heightRate(rate: 0.7), width: widthRate(rate: 0.47), height: widthRate(rate: 0.176))
        view.addSubview(eggsImgView)
        eggsImgView.isHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
//        let btn = TTButton.previousBtn()
//        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
//        view.addSubview(btn)
//        btn.rx.tap.subscribe(onNext: {
//            let vc2 = ViewController02()
//            let t = ViewController()
//            vc2.transitioningDelegate = t
//            self.present(vc2, animated: true, completion: nil)
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
            shake(view: henImgView)
            eggsImgView.isHidden = false
        } else if count == 1 {
            talkBoxImgView.isHidden = false
            label.isHidden = false
        } else if count == 2 {
            UIView.animate(withDuration: 1, animations: {
                self.henImgView.transform = CGAffineTransform(translationX: widthRate(rate:-0.7), y: 0)
                shake(view: self.henImgView)
            }) { (success) in
                let vc = BlackViewController()
                self.myPlayer = player(fileName: "04", type: "wav")
                self.myPlayer.play()
                vc.label.text = "半小时过后"
                vc.vc = ViewController04()
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                self.present(vc, animated: true, completion: nil)
            }
        }
        count += 1
    }
    
}
