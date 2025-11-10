//
//  ScratchView.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import SwiftUI

struct ScratchView<T: ScratchViewModelType>: ViewType {

    @ObservedObject private var viewModel: T

    init(viewModel: T) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            if let code = viewModel.code {
                Text(code)
            }

            buttonView()
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .onDisappear {
            viewModel.cancelScratching()
        }
    }

}

private extension ScratchView {

    func buttonView() -> some View {
        Button(
            "Scratch",
            action: {
                viewModel.scratch()
            }
        )
        .disabled(viewModel.isLoading || viewModel.code != nil)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }

}
