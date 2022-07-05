//
//  AppCoordinatorModel.swift
//  CoordinatorDemo
//
//  Created by 陳鈺翎 on 2022/7/3.
//

import Foundation

enum LaunchFlow {
    case main
    case login
}

class AppCoordinatorModel {
    
    
    func launchConfigure(completion: @escaping ((LaunchFlow) -> Void)) {
        let isLogin = UserDefaults.standard.bool(forKey: kIsLogin)
        !isLogin ? completion(.main): completion(.login)
    }
}
