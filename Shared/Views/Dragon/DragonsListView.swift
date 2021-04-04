//
//  ContentView.swift
//  Shared
//
//  Created by Peter Bødskov on 03/04/2021.
//

import SwiftUI

struct DragonsListView: View {

    @ObservedObject
    var viewModel = DragonsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.dragons, id: \.name) { dragon in
                NavigationLink(destination: DragonDetailView(dragon: dragon)) {
                    Text(dragon.name)
                }
            }
        }
        .onAppear { self.viewModel.loadDragons() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DragonsListView()
    }
}
