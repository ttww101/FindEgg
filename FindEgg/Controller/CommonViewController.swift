//
//  CommonViewController.swift
//  FindEgg
//
//  Created by Jack on 2019/6/10.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CommonViewController: UIViewController {
    func getCurrentIndex() -> Int {
        for (index, ele) in viewControllers.enumerated() {
            if ele == type(of: self) {
                return index
            }
        }
        fatalError()
    }
    
    func getPreviousViewController() -> UIViewController? {
        let index = getCurrentIndex()
        if index-1 < 0 || index-1 >= viewControllers.count {
            return nil
        } else {
            return viewControllers[index-1].init()
        }
    }
    
    func getNextViewController() -> UIViewController? {
        let index = getCurrentIndex()
        if index+1 < 0 || index+1 >= viewControllers.count {
            return nil
        } else {
            return viewControllers[index+1].init()
        }
    }
    
    let homeBtn = UIButton()
    let replayBtn = UIButton()
    let previousBtn = UIButton()
    let nextBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        homeBtn.setImage(UIImage(named: "home"), for: .normal)
        homeBtn.frame = CGRect(x: widthRate(rate: 0.05), y: heightRate(rate: 0.95), width: widthRate(rate: 0.07), height: widthRate(rate: 0.07))
        view.addSubview(homeBtn)
        homeBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-10)
            make.right.equalTo(view).offset(-10)
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
        replayBtn.setImage(UIImage(named: "retru"), for: .normal)
        replayBtn.frame = CGRect(x: widthRate(rate: 0.05), y: heightRate(rate: 0.95), width: widthRate(rate: 0.07), height: widthRate(rate: 0.07))
        view.addSubview(replayBtn)
        replayBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(view).offset(-10)
            make.right.equalTo(homeBtn.snp.left).offset(-10)
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
        previousBtn.setImage(UIImage(named: "back"), for: .normal)
        previousBtn.frame = CGRect(x: widthRate(rate: 0.05), y: heightRate(rate: 0.95), width: widthRate(rate: 0.07), height: widthRate(rate: 0.07))
        view.addSubview(previousBtn)
        previousBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.left.equalTo(view).offset(10)
            make.size.equalTo(CGSize(width: 36, height: 66))
        }
        previousBtn.rx.tap.subscribe(onNext: {
            if let vc = self.getPreviousViewController() {
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                self.present(vc, animated: true, completion: nil)
            }
        })
        nextBtn.setImage(UIImage(named: "next"), for: .normal)
        nextBtn.frame = CGRect(x: widthRate(rate: 0.05), y: heightRate(rate: 0.95), width: widthRate(rate: 0.07), height: widthRate(rate: 0.07))
        view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.right.equalTo(view).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 66))
        }
        nextBtn.rx.tap.subscribe(onNext: {
            if let vc = self.getNextViewController() {
                let viewControllerTransitioning = ViewControllerTransitioning()
                vc.transitioningDelegate = viewControllerTransitioning
                self.present(vc, animated: true, completion: nil)
            }
        })
    }

}
