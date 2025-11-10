//
//  NetworkServiceType.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation

protocol NetworkServiceType: DependencyInjectionService {

    func getVersionNumber(code: String) async throws -> Double
    
}
