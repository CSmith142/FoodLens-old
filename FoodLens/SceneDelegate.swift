//
//  SceneDelegate.swift
//  FoodLens
//
//  Created by Conor Smith on 20/04/2024.
//

import SwiftUI
import BarcodeScanner

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: TabbedContentView())
        self.window = window
        window.makeKeyAndVisible()
    }
}
