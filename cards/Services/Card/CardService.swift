//
//  CardService.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation
import Combine

final class CardService: CardServiceType {

    @Published var card: ScratchCard

    private let activationStatusSubject = PassthroughSubject<Bool, Never>()
    lazy var activationStatusPublisher = activationStatusSubject.eraseToAnyPublisher()

    private var networkService: NetworkServiceType

    private var scratchTask: Task<Void, Error>?
    private var activationTask: Task<Void, Error>?

    init(networkService: NetworkServiceType) {
        card = .init()
        self.networkService = networkService
    }

    func scratch() {
        scratchTask?.cancel()

        scratchTask = Task<Void, Error> {
            try await Task.sleep(for: .seconds(2))
            try Task.checkCancellation()
            let code = UUID().uuidString
            card.scratch(scratchedCode: code)
        }
    }

    func cancelScratching() {
        scratchTask?.cancel()
    }

    func activate() {
        activationTask?.cancel()

        guard let code = card.code else {
            activationStatusSubject.send(false)
            return
        }

        activationTask = Task<Void, Error> {
            do {
                let versionNumber = try await networkService.getVersionNumber(code: code)
                if versionNumber > 6.1 {
                    card.activate()
                    activationStatusSubject.send(true)
                } else {
                    activationStatusSubject.send(false)
                }
            } catch {
                activationStatusSubject.send(false)
            }
        }
    }

    func reset() {
        card = .init()
    }

}
