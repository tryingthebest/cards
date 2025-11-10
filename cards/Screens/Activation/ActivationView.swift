//
//  ActivationView.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import SwiftUI

struct ActivationView<T: ActivationViewModelType>: ViewType {

    @ObservedObject private var viewModel: T

    init(viewModel: T) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Text(viewModel.isActivated ? "✅" : "❌")

            buttonView()
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .alert(
            "Error",
            isPresented: $viewModel.isAlertPresented,
            actions: {},
            message: {
                Text("Activation failed")
            }
        )
    }

}

private extension ActivationView {

    func buttonView() -> some View {
        Button(
            "Activate",
            action: {
                viewModel.activate()
            }
        )
        .disabled(viewModel.isLoading || viewModel.isActivated)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }

}
