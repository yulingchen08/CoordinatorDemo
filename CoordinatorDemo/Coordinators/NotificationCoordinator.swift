//
//  NotificationCoordinator.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/4.
//

import UIKit

class NotificationCoordinator: BaseCoordinator {
    init() {
        super.init(router: NavigationRouter())
        start()
    }
    
    override func start() {
        let rootViewController = NotificationViewController()
        push(rootViewController, animated: false)
    }
}
