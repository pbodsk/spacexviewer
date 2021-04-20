//
//  PastLaunchesListView.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 05/04/2021.
//

import SwiftUI

struct PastLaunchesListView: View {
    @ObservedObject
    var viewModel = PastLaunchesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.pastLaunches, id: \.flightNumber) { launch in
                NavigationLink(
                    destination: PastLaunchDetailView(launch: launch)) {
                        Text(launch.name)
                    }
            }
        }
        .onAppear {
            viewModel.loadLaunches()
        }
    }
}

struct PastLaunchesListView_Previews: PreviewProvider {
    static var previews: some View {
        PastLaunchesListView()
    }
}
