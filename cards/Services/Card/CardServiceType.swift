//
//  CardServiceType.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Combine

protocol CardServiceType: DependencyInjectionService {

    var card: ScratchCard { get set }
    var activationStatusPublisher: AnyPublisher<Bool, Never> { get set }

    func scratch()
    func cancelScratching()

    func activate()

    func reset()

}
