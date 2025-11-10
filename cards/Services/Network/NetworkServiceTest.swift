//
//  NetworkServiceTest.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation

final class NetworkServiceTest: NetworkServiceType {

    var versionToReturn: Double
    var shouldThrow: Bool

    init(versionToReturn: Double, shouldThrow: Bool) {
        self.versionToReturn = versionToReturn
        self.shouldThrow = shouldThrow
    }

    func getVersionNumber(code: String) async throws -> Double {
        if shouldThrow {
            throw URLError(.unknown)
        }
        return versionToReturn
    }

}
