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
        showCameraFlow(camera: camera)
    }
    
    func printCoordinator() {
        print("[printCoordinator] counter: \(children)")
    }
        
    func goToDSLR(_ vc: CameraViewController, option: DeepLinkOption) {
        
        switch option {
        case .canonCamera:
            showCameraFlow(camera: .cannon)
        case .canonDSLR:
            showLensFlow(option: .canonDSLR)
        }
    
    }
}


extension CameraCoordinator {
    
    func showCameraFlow(camera: Camera) {
        let child = CameraDetailCoordinator(router: router)
        addChild(child)
        print("[CameraCoordinator] add CameraDetailCoordinator: \(self.children)")
        child.start(with: camera)
    }
    
    func showLensFlow(option: DeepLinkOption) {
        let child = CameraDetailCoordinator(router: router)
        addChild(child)
        print("[CameraCoordinator] add CameraDetailCoordinator: \(self.children)")
        
        child.start(with: option)
    }
    
}
