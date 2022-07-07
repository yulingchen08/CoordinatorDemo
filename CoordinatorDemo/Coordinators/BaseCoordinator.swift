//
//  BaseCoordinator.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/3.
//

import UIKit


class BaseCoordinator: Coordinator {
    var children: [Coordinator] = []
    var router: NavigationRouter
    var navigater: UINavigationController {
        return router.navigationViewController
    }
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
    func addChild(_ child: Coordinator) {
        children.append(child)
    }
    
    func push(_ viewController: UIViewController, animated: Bool) {
        viewController.coordinator = self //指定要push的vc中的coordinator
        router.push(viewController, animated: animated)
    }
    
    func pop(anmiated: Bool) {
        router.pop(animated: anmiated)
    }
    
    func start() {
        
    }
    
    
}


extension UIViewController {
    private enum CoordinatorAssociatedKeys {
        static var ownerKey: UInt = 0
    }

    weak var coordinator: Coordinator? {
        get {
            //利用objc的objc_getAssociatedObject向一個object給予值，稱為Associated Object，可以將一個值"關聯"到要extension的class上
            objc_getAssociatedObject(self, &CoordinatorAssociatedKeys.ownerKey) as? Coordinator
        }

        set {
            objc_setAssociatedObject(self, &CoordinatorAssociatedKeys.ownerKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}
