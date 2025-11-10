//
//  ScratchViewModelType.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation

protocol ScratchViewModelType: ObservableObject {

    var isLoading: Bool { get set }
    var code: String? { get set }

    func scratch()
    func cancelScratching()

}
