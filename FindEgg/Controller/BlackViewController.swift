//
//  BlackViewController.swift
//  FindEgg
//
//  Created by Jack on 2019/6/4.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit

class BlackViewController: UIViewController {
    
    let label = TTLabel.whiteTitleLabel()
    var vc = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
//        label.text = "半小时过后"
        
        label.numberOfLines = 2
        label.textAlignment = .center
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tap() {
        let viewControllerTransitioning = ViewControllerTransitioning()
        vc.transitioningDelegate = viewControllerTransitioning
        self.present(vc, animated: true, completion: nil)
    }

}
