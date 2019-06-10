//
//  AppDelegate.swift
//  FindEgg
//
//  Created by Jack on 2019/6/3.
//  Copyright © 2019 com.cn.mystory. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var myPlayer: AVAudioPlayer!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        myPlayer = player(fileName: "背景1525154876", type: "wav")
        myPlayer.numberOfLoops = -1
        myPlayer.play()
        return true
    }
}

func player(fileName: String, type: String) -> AVAudioPlayer {
//    return AVAudioPlayer()
    let path = Bundle.main.path(forResource: fileName, ofType: type)
    let url = URL(fileURLWithPath: path!)
    return try! AVAudioPlayer(contentsOf: url)
}
