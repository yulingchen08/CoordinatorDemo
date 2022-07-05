//
//  NavigationRouter.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/3.
//

import UIKit


class NavigationRouter: NSObject {
    var navigationViewController: UINavigationController
    private let rootViewController: UIViewController?
    
    init(navigationViewController: UINavigationController = UINavigationController()) {
        self.navigationViewController = navigationViewController
        self.rootViewController = self.navigationViewController.viewControllers.first
        super.init()
        self.navigationViewController.delegate = self
    }
    
    func push(_ viewController: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self.navigationViewController.pushViewController(viewController, animated: animated)
        }
    }
    
    func pop(animated: Bool) {
        DispatchQueue.main.async {
            guard let _ = self.rootViewController else {
                self.navigationViewController.popToRootViewController(animated: animated)
                return
            }

            self.navigationViewController.popViewController(animated: animated)
        }
    }
}



extension NavigationRouter: UINavigationControllerDelegate {
    // TODO:
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//
//    }
}
