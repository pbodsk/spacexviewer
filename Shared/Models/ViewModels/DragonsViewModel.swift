//
//  DragonsViewModel.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 03/04/2021.
//

import Combine
import Foundation

class DragonsViewModel: ObservableObject {
    var cancellables = Set<AnyCancellable>()

    @Published var dragons = [Dragon]()

    func loadDragons() {
        SpaceXAPI
            .dragons()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] dragons in
                    self?.dragons = dragons
                }
            )
            .store(in: &cancellables)
    }
}
