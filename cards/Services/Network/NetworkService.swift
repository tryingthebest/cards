//
//  NetworkService.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import Foundation

final class NetworkService: NetworkServiceType {

    func getVersionNumber(code: String) async throws -> Double {
        guard var url = URL(string: "https://api.o2.sk/version") else {
            throw URLError(.badURL)
        }

        url.append(queryItems: [.init(name: "code", value: code)])

        let (data, _) = try await URLSession.shared.data(from: url)
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        if let iosString = json?["ios"] as? String,
           let iosVersion = Double(iosString)
        {
            return iosVersion
        }

        throw URLError(.badServerResponse)
    }

}
