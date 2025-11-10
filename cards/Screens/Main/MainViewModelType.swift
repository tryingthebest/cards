//
//  MainViewModelType.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation

protocol MainViewModelType: ObservableObject {

    var card: ScratchCard? { get set }
    var isScratchButtonDisabled: Bool { get }
    var isActivationButtonDisabled: Bool { get }

    func goToScratch()
    func goToActivation()

    func reset()

}
