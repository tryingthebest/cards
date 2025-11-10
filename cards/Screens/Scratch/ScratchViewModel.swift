//
//  ScratchViewModel.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation
import Combine

final class ScratchViewModel: ScratchViewModelType {

    @Published var isLoading: Bool = false
    @Published var code: String?

    @Injected private var cardService: CardService

    private var codeCancellable: AnyCancellable?

    init() {
        codeCancellable = cardService.$card
            .receive(on: DispatchQueue.main)
            .sink { [weak self] card in
                self?.isLoading = false
                self?.code = card.code
            }
    }

    func scratch() {
        isLoading = true
        cardService.scratch()
    }

    func cancelScratching() {
        cardService.cancelScratching()
    }

}
