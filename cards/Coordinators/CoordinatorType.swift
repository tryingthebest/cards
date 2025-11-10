//
//  CoordinatorType.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import UIKit

protocol CoordinatorType {

    var controller: UIViewController? { get }
    var navigationController: UINavigationController? { get }
    func start() -> UIViewController

}

extension CoordinatorType {

    var navigationController: UINavigationController? {
        controller as? UINavigationController
    }

}
