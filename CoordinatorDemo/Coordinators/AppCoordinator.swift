//
//  AppCoordinator.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/3.
//

import UIKit


class AppCoordinator: BaseCoordinator {
    private weak var window: UIWindow?
    let model: AppCoordinatorModel = .init()
    private var loginCoordinator: LoginCoordinator?
    private var mainViewCoordinator: MainViewCoordinator?
    
    init(window: UIWindow?, router: NavigationRouter) {
        self.window = window
        super.init(router: router)
    }
    
    override func start() {
        launchConfigure()
    }
}


extension AppCoordinator {
    private func launchConfigure() {
        model.launchConfigure { [weak self] launchFlow in
            switch launchFlow {
            case .main:
                self?.showMainFlow()
            case .login:
                self?.showLoginFlow()
            }
        }
    }
    
    private func showMainFlow() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.mainViewCoordinator = MainViewCoordinator()
            self.setRootModule(self.mainViewCoordinator)
            self.loginCoordinator = nil
        }
    }
    
    private func showLoginFlow() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.loginCoordinator = LoginCoordinator()
            self.setRootModule(self.loginCoordinator)
            self.mainViewCoordinator = nil
        }
    }
    
    private func setRootModule(_ controller: UIViewController?) {
        guard let window = window else { return }
        window.rootViewController = controller
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
}
