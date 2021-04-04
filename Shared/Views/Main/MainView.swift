//
//  MainView.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 04/04/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            DragonsListView()
                .tabItem {
                    Label("Dragon", systemImage: "d.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
