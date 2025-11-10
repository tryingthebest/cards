//
//  AppCoordinator.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import UIKit

final class AppCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        window.rootViewController = MainCoordinator().start()
        window.makeKeyAndVisible()
    }

}
