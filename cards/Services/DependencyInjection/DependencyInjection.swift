//
//  DependencyInjection.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation

protocol DependencyInjectionService {}

final class DependencyInjection {

    static let shared = DependencyInjection()

    private var services: [String: DependencyInjectionService] = [:]

    func register<T: DependencyInjectionService>(_ service: T) {
        services[String(describing: T.self)] = service
    }

    func resolve<T: DependencyInjectionService>(_ serviceType: T.Type) -> T {
        let key = String(describing: T.self)
        guard let service = services[key] as? T else {
            fatalError("No registered service for type \(key)")
        }
        return service
    }

}

extension DependencyInjection {

    func registerServices() {
        let networkService = NetworkService()
        register(networkService)

        let cardService = CardService(networkService: networkService)
        register(cardService)
    }

}
