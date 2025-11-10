//
//  MainViewModel.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation
import Combine

final class MainViewModel: MainViewModelType {

    private let coordinator: MainCoordinator
    @Injected private var cardService: CardService

    @Published var card: ScratchCard?
    private var cardCancellation: AnyCancellable?

    var isScratchButtonDisabled: Bool {
        card?.state != .unscratched
    }

    var isActivationButtonDisabled: Bool {
        card?.state != .scratched
    }

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        card = cardService.card

        cardCancellation = cardService.$card
            .receive(on: DispatchQueue.main)
            .sink { [weak self] card in
                self?.card = card
            }
    }

    func goToScratch() {
        coordinator.goToScratch()
    }

    func goToActivation() {
        coordinator.goToActivation()
    }

    func reset() {
        cardService.reset()
    }

}
