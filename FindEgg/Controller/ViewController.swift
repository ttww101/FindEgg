//
//  ViewController.swift
//  FindEgg
//
//  Created by Jack on 2019/6/3.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

let viewControllers = [ViewController.self, ViewController02.self, ViewController03.self, ViewController04.self, ViewController05.self, ViewController06.self, ViewController07.self, ViewController08.self, ViewController09.self, ViewController10.self]

class ViewController: CommonViewController, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ViewController()
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)! as! ViewController
        let toViewController = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toViewController.view)
        containerView.addSubview(fromViewController.view)
//        self.leftScreenImgView.isHidden = true
//        self.teacherImgView.isHidden = true
        fromViewController.view.backgroundColor = .clear
        UIView.animate(withDuration: 1, animations: {
            let width = self.view.bounds.width
            let height = self.view.bounds.height
            
//            fromViewController.view.alpha = 0
            fromViewController.startBtn.alpha = 0
            fromViewController.leftScreenImgView.frame = CGRect(x: -width/2, y: 0, width: width/2, height: height)
            fromViewController.rightScreenImgView.frame = CGRect(x: width, y: 0, width: width/2, height: height)

//            toViewController.view.alpha = 1
            
        }, completion: { finished in
            UIView.animate(withDuration: 1.0, animations: {
                fromViewController.teacherImgView.frame = CGRect(x: widthRate(rate: 0.02), y: heightRate(rate: 0.3), width: widthRate(rate: 0.25), height: widthRate(rate: 0.424))
                fromViewController.topScreenImgView.transform = CGAffineTransform(translationX: 0, y: heightRate(rate: -0.28))
            }, completion: { (_) in
                // text
                UIView.animate(withDuration: 1.0, animations: {
                    fromViewController.label.alpha = 1
                }, completion: { (_) in
                    UIView.animateKeyframes(withDuration: 1.0, delay: 3.0, options: [], animations: {
                        fromViewController.view.alpha = 0
                    }, completion: { (_) in
                        transitionContext.completeTransition(true)
                    })
                    
                })
            })
            
//            UIView.animate(withDuration: 1.0, animations: {
//                <#code#>
//            }, completion: { (_) in
//                <#code#>
//            })
            
            
            
        })
        
    }
    
    var leftScreenImgView: UIImageView!
    var rightScreenImgView: UIImageView!
    var teacherImgView: UIImageView!
    
    let centerX = UIScreen.main.bounds.width / 2
    let centerY = UIScreen.main.bounds.height / 2
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height

    var label = UILabel()
    var startBtn = UIButton()
    var topScreenImgView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myPlayer = player(fileName: "背景1525154876", type: "wav")
        myPlayer.play()
        
        let width = self.width
        let height = self.height

        leftScreenImgView = UIImageView(named: "story_chicken_r01")
        leftScreenImgView.frame = CGRect(x: 0, y: 0, width: width/2, height: height)
        view.addSubview(leftScreenImgView)
        
        rightScreenImgView = UIImageView(named: "story_chicken_r02")
        rightScreenImgView.frame = CGRect(x: width/2, y: 0, width: width/2, height: height)
        view.addSubview(rightScreenImgView)
        
        topScreenImgView = UIImageView(named: "story_chicken_r03")
        topScreenImgView.frame = CGRect(x: 0, y: 0, width: width, height: heightRate(rate: 0.28))
        view.addSubview(topScreenImgView)
        
        
        label = TTLabel.whiteTitleLabel()
        label.text = "这是一个关于鸡妈妈的故事"
        label.textColor = .black
        label.sizeToFit()
        label.center = CGPoint(x: centerX + widthRate(rate: 0.05), y: heightRate(rate: 0.55))
        label.alpha = 0
        
        view.addSubview(label)

        teacherImgView = UIImageView(named: "story_chicken_t")
        teacherImgView.frame = CGRect(x: widthRate(rate: 0.02), y: heightRate(rate: 0.3), width: widthRate(rate: 0.25), height: widthRate(rate: 0.424))
        teacherImgView.center.x = view.center.x
        view.addSubview(teacherImgView)
//        teacherImgView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(view)
//            make.top.equalTo(heightRate(rate: 0.3))
//            make.size.equalTo(CGSize(width: widthRate(rate: 0.25), height: widthRate(rate: 0.424)))
//        }
        
        startBtn = TTButton.startBtn()
        startBtn.center = CGPoint(x: centerX, y: heightRate(rate: 0.8))
        startBtn.setTitleColor(.white, for: .normal)
        view.addSubview(startBtn)
        

        
        startBtn.rx.tap.subscribe(onNext: {
//            UIView.animate(withDuration: 1.0, animations: {
//                self.leftScreenImgView.frame = CGRect(x: -width/2, y: 0, width: width/2, height: height)
//                self.rightScreenImgView.frame = CGRect(x: width, y: 0, width: width/2, height: height)
//
//                startBtn.alpha = 0.0
//            }, completion: { (_) in
//                UIView.animate(withDuration: 1.0, animations: {
//                    self.teacherImgView.frame = CGRect(x: widthRate(rate: 0.02), y: heightRate(rate: 0.3), width: widthRate(rate: 0.25), height: widthRate(rate: 0.424))
//                }, completion: { (_) in
//
//                })
//            })
            let vc2 = ViewController02()
            vc2.transitioningDelegate = self
            self.present(vc2, animated: true, completion: nil)
        })
        
        let settingBtn = UIButton()
        settingBtn.setImage(UIImage(named: "setting"), for: .normal)
        settingBtn.frame = CGRect(x: widthRate(rate: 0.05), y: heightRate(rate: 0.95), width: widthRate(rate: 0.07), height: widthRate(rate: 0.07))
        view.addSubview(settingBtn)
        settingBtn.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
        
//        settingBtn.rx.tap.subscribe(onNext: {
//            for (index, ele) in viewControllers.enumerated() {
//                if ele == type(of: self) {
//                    print(index)
//                    self.present(ele.init(), animated: true, completion: nil)
//                }
//            }
//        })
        previousBtn.isHidden = true
        nextBtn.isHidden = true
        view.bringSubviewToFront(homeBtn)
        view.bringSubviewToFront(replayBtn)
        view.bringSubviewToFront(previousBtn)
        view.bringSubviewToFront(nextBtn)

    }


}

func shake(view: UIView) {
    let momAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
    momAnimation.fromValue = NSNumber(value: -0.1) //左幅度
    momAnimation.toValue = NSNumber(value: 0.1) //右幅度
    momAnimation.duration = 0.1
    momAnimation.repeatCount = 2 //无限重复
    momAnimation.autoreverses = true //动画结束时执行逆动画
    view.layer.add(momAnimation, forKey: "centerLayer")
}

func shake(view: UIView, time: Int) {
    let momAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
    momAnimation.fromValue = NSNumber(value: -0.1) //左幅度
    momAnimation.toValue = NSNumber(value: 0.1) //右幅度
    momAnimation.duration = 0.1
    momAnimation.repeatCount = Float(time) //无限重复
    momAnimation.autoreverses = true //动画结束时执行逆动画
    view.layer.add(momAnimation, forKey: "centerLayer")
}

