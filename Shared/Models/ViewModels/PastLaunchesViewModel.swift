//
//  PastLaunchesViewModel.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 05/04/2021.
//

import Combine
import Foundation

class PastLaunchesViewModel: ObservableObject {
    var canbellables = Set<AnyCancellable>()

    @Published var pastLaunches = [Launch]()

    func loadLaunches() {
        SpaceXAPI
            .pastLaunches()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] pastLaunches in
                    self?.pastLaunches = pastLaunches
                }
            )
            .store(in: &canbellables)
    }
}
