//
//  SpaceXAPI.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 03/04/2021.
//

import Combine
import Foundation

enum SpaceXAPI {
    static let agent = Agent()
    static let base = URL(string: "https://api.spacexdata.com/v4")!

    static func dragons() -> AnyPublisher<[Dragon], Error> {
        let request = URLRequest(url: base.appendingPathComponent("dragons"))

        return agent
            .run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }

    static func pastLaunches() -> AnyPublisher<[Launch], Error> {
        let request = URLRequest(url: base.appendingPathComponent("launches/past"))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)

            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            if let date = formatter.date(from: dateStr) {
                return date
            } else {
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                if let date = formatter.date(from: dateStr) {
                    return date
                }
            }

            return Date()
        })
        return agent
            .run(request, decoder)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
