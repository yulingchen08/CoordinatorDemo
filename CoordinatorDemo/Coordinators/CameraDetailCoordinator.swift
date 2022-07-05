//
//  CameraDetailCoordinator.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/5.
//

import UIKit

class CameraDetailCoordinator: BaseCoordinator {
    
    
    func start(with camera: Camera) {
        let vc = CameraDetailViewController(camera: camera)
        print("[CameraDetailCoordinator] counter: \(children)")
        vc.delegate = self
        push(vc, animated: true)
    }
}


extension CameraDetailCoordinator: CameraDetailDelegate {
    func didClickLength(_ vc: CameraDetailViewController, camera: Camera) {
        //因為是最後一頁，這裡直接new viewcontroller 不用在用一個LensCoordinator
        let vc = LensViewController(camera: camera)
        push(vc, animated: true)
    }
    
    
}
