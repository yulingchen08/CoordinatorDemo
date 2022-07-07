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
    //每次navigationController有push或pop時，都會invoke
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print("[DEBUG][NavigationRouter] navigationController: \(viewController)")
        //給.from，可以拿到navigation要pop哪個vc
        //給.to，可以拿到navigation要push那個vc
        guard let dismissedVieController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(dismissedVieController),
              let dismissedCoordinator = dismissedVieController.coordinator else {
            return
        }
        print("[DEBUG][NavigationRouter] remove dismissedCoordinator: \(dismissedVieController)")
        viewController.coordinator?.removeChild(child: dismissedCoordinator)

    }
}
