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
}
