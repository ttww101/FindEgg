//
//  ViewControllerTransitioning.swift
//  FindEgg
//
//  Created by Jack on 2019/6/4.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit

class ViewControllerTransitioning: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CommonViewControllerAnimatedTransitioning()
    }
}
