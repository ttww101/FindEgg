//
//  ViewController07.swift
//  FindEgg
//
//  Created by Jack on 2019/6/4.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController07: CommonViewController {
    var talkContent = "是不是你\n吃了我的蛋"
    
    let henImgView = UIImageView(named: "story_chicken_ck401")
    let talkBoxImgView = UIImageView(named: "story_chicken_tk402")
    let talkBoxImgView2 = UIImageView(named: "story_chicken_tk401")
    let label = TTLabel.brownDesciptionLabel()
    let label2 = TTLabel.brownDesciptionLabel()
    var animalImgView = UIImageView(named: "story_chicken_am401")
    var myPlayer :AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        henImgView.isHidden = true
        talkBoxImgView.isHidden = true
        talkBoxImgView2.isHidden = true
        label.isHidden = true
        label2.isHidden = true
        animalImgView.isHidden = true
        setBgImg(name: "story_chicken_back04", view: view)
        
        henImgView.frame = CGRect(x: widthRate(rate: 0.04), y: heightRate(rate: 0.23), width: widthRate(rate: 0.45), height: widthRate(rate: 0.4))
        view.addSubview(henImgView)
        
        talkBoxImgView.frame = CGRect(x: widthRate(rate: 0.27), y: heightRate(rate: 0), width: widthRate(rate: 0.236), height: heightRate(rate: 0.29))
        view.addSubview(talkBoxImgView)
        
        talkBoxImgView2.frame = CGRect(x: widthRate(rate: 0.53), y: heightRate(rate: 0.09), width: widthRate(rate: 0.24), height: widthRate(rate: 0.213))
        view.addSubview(talkBoxImgView2)
        
        label.text = talkContent
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 6
        label.frame = CGRect(x: widthRate(rate: 0.27), y: heightRate(rate: 0), width: widthRate(rate: 0.236), height: heightRate(rate: 0.29))
        label.textAlignment = .center
        var centerX = talkBoxImgView.center.x
        var centerY = talkBoxImgView.center.y
        label.center = CGPoint(x: centerX + widthRate(rate: 0.01), y: centerY + heightRate(rate: -0.02))
        view.addSubview(label)
        
        label2.text = "我可没吃\n你的蛋\n别冤枉我啊"
        label2.font = UIFont.systemFont(ofSize: 18)
        label2.numberOfLines = 6
        label2.textAlignment = .center
        label2.frame = CGRect(x: widthRate(rate: 0.53), y: heightRate(rate: 0.09), width: widthRate(rate: 0.24), height: heightRate(rate: 0.213))
        centerX = talkBoxImgView2.center.x
        centerY = talkBoxImgView2.center.y
        label2.center = CGPoint(x: centerX + widthRate(rate: -0.02), y: centerY + heightRate(rate: 0))
        view.addSubview(label2)
        
        
        animalImgView.frame = CGRect(x: widthRate(rate: 0.66), y: heightRate(rate: 0.37), width: widthRate(rate: 0.27), height: widthRate(rate: 0.348))
        view.addSubview(animalImgView)
        
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
//        let btn = TTButton.previousBtn()
//        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
//        view.addSubview(btn)
//        btn.rx.tap.subscribe(onNext: {
//            let vc = ViewController06()
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
            shake(view: henImgView)
        } else if count == 1 {
            animalImgView.isHidden = false
            shake(view: animalImgView)
        } else if count == 2 {
            talkBoxImgView.isHidden = false
            label.isHidden = false
        } else if count == 3 {
            talkBoxImgView2.isHidden = false
            label2.isHidden = false
            myPlayer = player(fileName: "14蛇", type: "mp3")
        } else if count == 4 {
            let vc = ViewController08()
            let viewControllerTransitioning = ViewControllerTransitioning()
            vc.transitioningDelegate = viewControllerTransitioning
            self.present(vc, animated: true, completion: nil)
        }
        count += 1
    }
}
