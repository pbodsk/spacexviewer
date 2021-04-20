//
//  Header.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 20/04/2021.
//

import SwiftUI

struct Header: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Hello, World!")
    }
}
