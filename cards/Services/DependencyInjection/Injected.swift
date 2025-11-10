//
//  Injected.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

@propertyWrapper
struct Injected<T: DependencyInjectionService> {

    private let serviceType: T.Type
    private let container: DependencyInjection

    init(_ serviceType: T.Type = T.self) {
        self.serviceType = serviceType
        self.container = .shared
    }

    var wrappedValue: T {
        container.resolve(serviceType)
    }

}
