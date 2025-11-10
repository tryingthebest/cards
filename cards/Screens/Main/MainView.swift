//
//  MainView.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import SwiftUI

struct MainView<T: MainViewModelType>: ViewType {

    @ObservedObject private var viewModel: T

    init(viewModel: T) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            if let card = viewModel.card {
                cardView(card)
            }

            buttonsView()
        }
    }

}

private extension MainView {

    func cardView(_ card: ScratchCard) -> some View {
        VStack {
            Text("Card: ")
                .font(.title)

            Text(card.id.uuidString)

            Divider()

            Text(card.state.rawValue)
        }
    }

    func buttonsView() -> some View {
        VStack {
            Button(
                "Go to scratch",
                action: {
                    viewModel.goToScratch()
                }
            )
            .disabled(viewModel.isScratchButtonDisabled)

            Button(
                "Go to activation",
                action: {
                    viewModel.goToActivation()
                }
            )
            .disabled(viewModel.isActivationButtonDisabled)

            Button(
                "Reset card",
                action: {
                    viewModel.reset()
                }
            )
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }

}
