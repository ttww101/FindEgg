//
//  ViewController10.swift
//  FindEgg
//
//  Created by Jack on 2019/6/4.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController10: CommonViewController, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ViewController10()
    }
    var myPlayer :AVAudioPlayer!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let toViewController = transitionContext.viewController(forKey: .to)! as! ViewController10
        let containerView = transitionContext.containerView
        
        containerView.addSubview(fromViewController.view)
        containerView.addSubview(toViewController.view)
        

        toViewController.leftScreenImgView.frame = CGRect(x: -width/2, y: 0, width: width/2, height: height)
        toViewController.rightScreenImgView.frame = CGRect(x: width, y: 0, width: width/2, height: height)
        
        
        UIView.animate(withDuration: 1, animations: {
            let width = self.view.bounds.width
            let height = self.view.bounds.height
            
//            fromViewController.view.alpha = 0
            toViewController.leftScreenImgView.frame = CGRect(x: 0, y: 0, width: width/2, height: height)
            toViewController.rightScreenImgView.frame = CGRect(x: width/2, y: 0, width: width/2, height: height)
            toViewController.view.alpha = 1
            
        }, completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                toViewController.view.alpha = 1
            }, completion: { finished in
                transitionContext.completeTransition(true)
            })
            
        })
        
    }
    
    var leftScreenImgView: UIImageView!
    var rightScreenImgView: UIImageView!
    let henImgView = UIImageView(named: "story_chicken_ck602")
    let teacherImgView = UIImageView(named: "story_chicken_t")
    let talkBoxImgView = UIImageView(named: "story_chicken_tk601")
    let label = TTLabel.brownDesciptionLabel()
    let chickImgView1 = UIImageView(named: "story_chicken_sck01")
    let chickImgView2 = UIImageView(named: "story_chicken_sck02")
    let chickImgView3 = UIImageView(named: "story_chicken_sck03")
    let chickImgView4 = UIImageView(named: "story_chicken_sck04")
    let chickImgView5 = UIImageView(named: "story_chicken_sck05")
    let chickImgView6 = UIImageView(named: "story_chicken_sck06")
    let chickImgView7 = UIImageView(named: "story_chicken_sck07")
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        henImgView.isHidden = true
        teacherImgView.isHidden = true
        talkBoxImgView.isHidden = true
        label.isHidden = true
        chickImgView1.isHidden = true
        chickImgView2.isHidden = true
        chickImgView3.isHidden = true
        chickImgView4.isHidden = true
        chickImgView5.isHidden = true
        chickImgView6.isHidden = true
        chickImgView7.isHidden = true
        
        rightScreenImgView = UIImageView(named: "story_chicken_r02")
        
        view.addSubview(rightScreenImgView)
        
        teacherImgView.frame = CGRect(x: widthRate(rate: 0.38), y: heightRate(rate: 0.3), width: widthRate(rate: 0.25), height: widthRate(rate: 0.424))
        teacherImgView.transform = CGAffineTransform(rotationAngle: 0.1*CGFloat.pi)
        view.addSubview(teacherImgView)
        
        leftScreenImgView = UIImageView(named: "story_chicken_r01")
        view.addSubview(leftScreenImgView)
        
//        self.leftScreenImgView.frame = CGRect(x: -width/2, y: 0, width: width/2, height: height)
//        self.rightScreenImgView.frame = CGRect(x: width, y: 0, width: width/2, height: height)
        self.leftScreenImgView.frame = CGRect(x: 0, y: 0, width: width/2, height: height)
        self.rightScreenImgView.frame = CGRect(x: width/2, y: 0, width: width/2, height: height)
        
        
        let topScreenImgView = UIImageView(named: "story_chicken_r03")
        topScreenImgView.frame = CGRect(x: 0, y: 0, width: width, height: heightRate(rate: 0.28))
        view.addSubview(topScreenImgView)
        
        talkBoxImgView.frame = CGRect(x: widthRate(rate: 0.66), y: heightRate(rate: 0.20), width: heightRate(rate: 0.503), height: heightRate(rate: 0.37))
        view.addSubview(talkBoxImgView)
        
        label.text = "不见了东西\n也要仔细地找喔"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 6
        label.textAlignment = .center
        label.frame = CGRect(x: widthRate(rate: 0.66), y: heightRate(rate: 0.34), width: heightRate(rate: 0.503), height: heightRate(rate: 0.37))
        let centerX = talkBoxImgView.center.x
        let centerY = talkBoxImgView.center.y
        label.center = CGPoint(x: centerX + widthRate(rate: 0), y: centerY + heightRate(rate: -0.03))
        view.addSubview(label)
        
        henImgView.frame = CGRect(x: widthRate(rate: 0.69), y: heightRate(rate: 0.6), width: widthRate(rate: 0.24), height: widthRate(rate: 0.215))
        view.addSubview(henImgView)
        chickImgView1.frame = CGRect(x: widthRate(rate: 0.087), y: heightRate(rate: 0.8), width: widthRate(rate: 0.1), height: widthRate(rate: 0.1))
        view.addSubview(chickImgView1)
        chickImgView2.frame = CGRect(x: widthRate(rate: 0.193), y: heightRate(rate: 0.8), width: widthRate(rate: 0.1), height: widthRate(rate: 0.1))
        view.addSubview(chickImgView2)
        chickImgView3.frame = CGRect(x: widthRate(rate: 0.27), y: heightRate(rate: 0.8), width: widthRate(rate: 0.1), height: widthRate(rate: 0.1))
        view.addSubview(chickImgView3)
        chickImgView4.frame = CGRect(x: widthRate(rate: 0.363), y: heightRate(rate: 0.8), width: widthRate(rate: 0.1), height: widthRate(rate: 0.1))
        view.addSubview(chickImgView4)
        chickImgView5.frame = CGRect(x: widthRate(rate: 0.46), y: heightRate(rate: 0.8), width: widthRate(rate: 0.1), height: widthRate(rate: 0.1))
        view.addSubview(chickImgView5)
        chickImgView6.frame = CGRect(x: widthRate(rate: 0.55), y: heightRate(rate: 0.8), width: widthRate(rate: 0.1), height: widthRate(rate: 0.1))
        view.addSubview(chickImgView6)
        chickImgView7.frame = CGRect(x: widthRate(rate: 0.63), y: heightRate(rate: 0.8), width: widthRate(rate: 0.1), height: widthRate(rate: 0.1))
        view.addSubview(chickImgView7)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
        
//        let btn = TTButton.previousBtn()
//        btn.center = CGPoint(x: widthRate(rate: 0.1), y: heightRate(rate: 0.9))
//        view.addSubview(btn)
//        btn.rx.tap.subscribe(onNext: {
//            let vc = ViewController09()
//            let viewControllerTransitioning = ViewControllerTransitioning()
//            vc.transitioningDelegate = viewControllerTransitioning
//            self.present(vc, animated: true, completion: nil)
//        })
//        btn.isHidden = true
        
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
            let chicks = [chickImgView1, chickImgView2, chickImgView3, chickImgView4, chickImgView5, chickImgView6, chickImgView7]
            var rect = CGPoint(x: henImgView.center.x, y: chickImgView7.center.y)
            var delayCount: TimeInterval = 0
            chickImgView7.isHidden = false
            let time = 0.5
            for chick in chicks.reversed() {
                let center = chick.center
                chick.center = rect
//                UIView.animate(withDuration: 1) {
//                    chick.center = center
//                }
                do {
                    let delayCount = delayCount
                    UIView.animate(withDuration: time, delay: delayCount, options: [], animations: {
                            chick.center = center
                    }, completion: { (success) in
                            if (5-delayCount/time) >= 0 {
                                chicks[Int(ceil(5-delayCount/time))].isHidden = false
                            }
                    })
                }
                
                rect = center
                delayCount += time
            }
        } else if count == 3 {
            let vc = ViewController()
            let viewControllerTransitioning = ViewControllerTransitioning()
            vc.transitioningDelegate = viewControllerTransitioning
            self.present(vc, animated: true, completion: nil)
        }
        count += 1
    }

}
