//
//  MainCoordinator.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import UIKit

final class MainCoordinator: CoordinatorType {

    weak var controller: UIViewController?

    func start() -> UIViewController {
        let viewModel = MainViewModel(coordinator: self)
        let view = MainView(viewModel: viewModel)
        let controller = view.inViewController
        let navigationController = UINavigationController(rootViewController: controller)
        self.controller = navigationController

        return navigationController
    }

}

extension MainCoordinator {

    func goToScratch() {
        let viewModel = ScratchViewModel()
        let view = ScratchView(viewModel: viewModel)
        let controller = view.inViewController

        navigationController?.pushViewController(controller, animated: true)
    }

    func goToActivation() {
        let viewModel = ActivationViewModel()
        let view = ActivationView(viewModel: viewModel)
        let controller = view.inViewController

        navigationController?.pushViewController(controller, animated: true)
    }

}
