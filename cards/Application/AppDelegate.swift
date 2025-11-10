//
//  AppDelegate.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        // MARK: - Dependency Injection

        DependencyInjection.shared.registerServices()

        // MARK: - Coordinator

        coordinator = AppCoordinator(window: window)
        coordinator?.start()

        return true
    }


}

