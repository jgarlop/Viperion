//
//  SceneDelegate.swift
//  Viperion
//
//  Created by Javier García López on 19/2/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        configureWindow(scene)
        navigateToFirstModule()
    }
}

extension SceneDelegate {
    private func configureWindow(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        self.window = window
        window.rootViewController = UINavigationController()
        UIApplication.serviceLocator.appRouter.window = window
    }

    private func navigateToFirstModule() {
        let loginModule = LoginRouter.assemble()
        UIApplication.serviceLocator.appRouter.set(loginModule)
    }
}
