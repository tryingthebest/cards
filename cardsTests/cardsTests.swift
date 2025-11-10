//
//  cardsTests.swift
//  cardsTests
//
//  Created by tryingthebest on 09/11/2025.
//

import Testing
@testable import cards

struct cardsTests {

    // MARK: - Helpers

    func makeCardService(version: Double = 7, shouldThrow: Bool = false) -> CardService {
        let network = NetworkServiceTest(versionToReturn: version, shouldThrow: shouldThrow)
        network.versionToReturn = version
        return CardService(networkService: network)
    }

    // MARK: - Scratch Tests

    @Test
    func scratchUpdatesCard() async {
        let service = makeCardService()
        #expect(service.card.state == .unscratched)

        service.scratch()
        try? await Task.sleep(for: .seconds(2.1))

        #expect(service.card.state == .scratched)
        #expect(service.card.code != nil)
    }

    @Test
    func scratchCancelledDoesNotUpdate() async {
        let service = makeCardService()
        service.scratch()
        service.cancelScratching()
        try? await Task.sleep(for: .seconds(2.1))

        #expect(service.card.state == .unscratched)
        #expect(service.card.code == nil)
    }

    // MARK: - Activation Tests

    @Test
    func activateSuccessUpdatesCard() async {
        let service = makeCardService()
        service.card = ScratchCard(state: .scratched, code: "CODE123")

        var receivedStatus: Bool?
        let cancellable = service.activationStatusPublisher.sink { status in
            receivedStatus = status
        }

        service.activate()
        try? await Task.sleep(for: .seconds(0.5))

        #expect(service.card.state == .activated)
        #expect(receivedStatus == true)

        cancellable.cancel()
    }

    @Test
    func activateWrongVersionFails() async {
        let service = makeCardService(version: 5)
        service.card = ScratchCard(state: .scratched, code: "CODE123")

        var receivedStatus: Bool?
        let cancellable = service.activationStatusPublisher.sink { status in
            receivedStatus = status
        }

        service.activate()
        try? await Task.sleep(for: .seconds(0.5))

        #expect(service.card.state == .scratched)
        #expect(receivedStatus == false)

        cancellable.cancel()
    }

    @Test
    func activateThrowFails() async {
        let service = makeCardService(shouldThrow: true)
        service.card = ScratchCard(state: .scratched, code: "CODE123")

        var receivedStatus: Bool?
        let cancellable = service.activationStatusPublisher.sink { status in
            receivedStatus = status
        }

        service.activate()
        try? await Task.sleep(for: .seconds(0.5))

        #expect(service.card.state == .scratched)
        #expect(receivedStatus == false)

        cancellable.cancel()
    }

    @Test
    func resetResetsCard() async {
        let service = makeCardService()
        service.card = ScratchCard(state: .scratched, code: "ABC")
        service.reset()

        #expect(service.card.state == .unscratched)
        #expect(service.card.code == nil)
    }

}
