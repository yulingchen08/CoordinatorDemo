//
//  CameraCoordinator.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/4.
//

import UIKit

class CameraCoordinator: BaseCoordinator {
    private let rootViewController = CameraViewController()
    
    init() {
        super.init(router: NavigationRouter())
        start()
    }
    
    override func start() {
        rootViewController.delegate = self
        print("[CameraCoordinator] \(self.children)")
        push(rootViewController, animated: false)
    }
}

extension CameraCoordinator: CameraViewControllerDelegate {
    func didClickCamera(_ vc: CameraViewController, camera: Camera) {
        let child = CameraDetailCoordinator(router: router)
        addChild(child)
        print("[CameraCoordinator] add CameraDetailCoordinator: \(self.children)")
        child.start(with: camera)
    }
    
    func printCoordinator() {
        print("[printCoordinator] counter: \(children)")
    }
    
    
}
