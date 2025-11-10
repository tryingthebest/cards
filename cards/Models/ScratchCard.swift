//
//  ScratchCard.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation

struct ScratchCard {

    enum CardState: String {

        case unscratched
        case scratched
        case activated

    }

    let id: UUID
    var state: CardState
    var code: String?

    init(
        id: UUID = UUID(),
        state: CardState = .unscratched,
        code: String? = nil
    ) {
        self.id = id
        self.state = state
        self.code = code
    }

    mutating func scratch(scratchedCode: String) {
        guard state == .unscratched,
              code == nil
        else { return }

        state = .scratched
        code = scratchedCode
    }

    mutating func activate() {
        guard state == .scratched,
              code != nil
        else { return }

        state = .activated
    }

}
