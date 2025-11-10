//
//  ActivationViewModelType.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation

protocol ActivationViewModelType: ObservableObject {

    var isLoading: Bool { get set }
    var isActivated: Bool { get set }
    var isAlertPresented: Bool { get set }

    func activate()

}
