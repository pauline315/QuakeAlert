//
//  SceneDelegate.swift
//  TremorWatch
//
//  Created by EMTECH MAC on 12/06/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = MainTabbarController()
        window?.makeKeyAndVisible()
    }
}





   
