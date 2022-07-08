//
//  CameraDetailCoordinator.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/5.
//

import UIKit

class CameraDetailCoordinator: BaseCoordinator {
    
    
    func start(with camera: Camera) {
        showCameraDetailViewController(camera: camera)
        //presentCameraDetailViewController(camera: camera)
        //FIXME: memory leak(CameraDetailCoordinator) when presenting CameraDetailViewController
    }
    
    func start(with option: DeepLinkOption) {
        switch option {
        case .canonDSLR:
            showCameraDetailViewController(camera: .cannon)
            //showLensViewController(camera: .cannon)
            presentLensViewController(camera: .cannon)
        case .canonCamera:
            showCameraDetailViewController(camera: .cannon)
        }
    }
}


extension CameraDetailCoordinator: CameraDetailDelegate {
    func didClickLength(_ vc: CameraDetailViewController, camera: Camera) {
        //因為是最後一頁，這裡直接new viewcontroller 不用在用一個LensCoordinator
        //showLensViewController(camera: camera)
        presentLensViewController(camera: camera)
    }
    
    
}


extension CameraDetailCoordinator {
    func showCameraDetailViewController(camera: Camera) {
        let vc = CameraDetailViewController(camera: camera)
        print("[CameraDetailCoordinator] counter: \(children)")
        vc.delegate = self
        push(vc, animated: true)
    }
    
    func presentCameraDetailViewController(camera: Camera) {
        let vc = CameraDetailViewController(camera: camera)
        vc.delegate = self
        present(viewController: vc, animated: true, completion: nil)
    }
    
    func showLensViewController(camera: Camera) {
        let vc = LensViewController(camera: camera)
        push(vc, animated: true)
    }
    
    func presentLensViewController(camera: Camera) {
        let vc = LensViewController(camera: camera)
        present(viewController: vc, animated: true, completion: {
            print("Presenting \(camera.lens)")
        })
    }
}
