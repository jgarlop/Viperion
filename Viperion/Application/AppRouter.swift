//
//  AppRouter.swift
//  Viperion
//
//  Created by Javier García López on 26/2/21.
//

import UIKit

enum AppRoute {}

protocol AppRouter {
    var window : UIWindow? { get set }

    func set(_ vc: UIViewController)
    func present(_ vc: UIViewController, completion: (() -> Void)?)
    func present(_ vc: UIViewController, style: UIModalPresentationStyle, completion: (() -> Void)?)
    func push(_ vc: UIViewController)
    func pop()
    func navigateTo(route: AppRoute)
}

class AppRouterImpl: AppRouter {
    var window: UIWindow? {
        didSet {
            navController = window?.rootViewController as? UINavigationController
        }
    }

    private var navController: UINavigationController?

    func set(_ vc: UIViewController) {
        navController?.setViewControllers([vc], animated: true)
    }

    func present(_ vc: UIViewController, completion: (() -> Void)? = nil) {
        navController?.present(vc, animated: true, completion: completion)
    }

    func present(_ vc: UIViewController, style: UIModalPresentationStyle, completion: (() -> Void)? = nil) {
        vc.modalPresentationStyle = style
        present(vc, completion: completion)
    }

    func push(_ vc: UIViewController) {
        navController?.pushViewController(vc, animated: true)
    }

    func pop() {
        navController?.popViewController(animated: true)
    }

    func navigateTo(route: AppRoute) {
        // To implement
    }
}

