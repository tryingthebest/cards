//
//  ActivationViewModel.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation
import Combine

final class ActivationViewModel: ActivationViewModelType {

    @Published var isLoading: Bool = false
    @Published var isActivated: Bool = false
    @Published var isAlertPresented: Bool = false

    @Injected private var cardService: CardService

    private var activationCancellable: AnyCancellable?

    init() {
        activationCancellable = cardService.activationStatusPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isActivated in
                self?.isLoading = false
                self?.isActivated = isActivated
                self?.isAlertPresented = !isActivated
            }
    }

    func activate() {
        isLoading = true
        cardService.activate()
    }

}
