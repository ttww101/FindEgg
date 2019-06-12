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
        
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
            volume = CGFloat(UserDefaults.standard.double(forKey: "volume"))
            speed = CGFloat(UserDefaults.standard.double(forKey: "speed"))
        } else {
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            UserDefaults.standard.set(Double(volume), forKey: "volume")
            UserDefaults.standard.set(Double(speed), forKey: "speed")
        }
        return true
    }
}

var volume: CGFloat = 1.0

func player(fileName: String, type: String) -> AVAudioPlayer {
//    return AVAudioPlayer()
    let path = Bundle.main.path(forResource: fileName, ofType: type)
    let url = URL(fileURLWithPath: path!)
    let player = try! AVAudioPlayer(contentsOf: url)
    player.volume = Float(volume)
    return player
}
