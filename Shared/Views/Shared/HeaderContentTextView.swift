//
//  HeaderContentTextView.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 04/04/2021.
//

import SwiftUI

struct HeaderContentTextView: View {
    let header: String
    let content: String
    var body: some View {
        HStack {
            Text(header)
                .bold()
                .frame(width: 200, alignment: .leading)
            Text(content)
                .multilineTextAlignment(.trailing)
        }
        .padding(.bottom, 8)
    }
}

struct HeaderContentTextView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderContentTextView(header: "Header", content: "Content")
    }
}
