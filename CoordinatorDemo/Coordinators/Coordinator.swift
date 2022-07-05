//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/3.
//

import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    var router: NavigationRouter { get set }
    
    func start()
    func addChild(_ child: Coordinator)
    func removeChild(child: Coordinator)
}


extension Coordinator {
    func start() {}
    func removeChild(child: Coordinator) {
        child.children.forEach { $0.children.removeAll() }
        for (index, coordinator) in children.enumerated() {
            if coordinator === child {
                children.remove(at: index)
            }
        }
    }
}


