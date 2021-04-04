//
//  ImageCaroussel.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 04/04/2021.
//

import SwiftUI

struct ImageCaroussel: View {
    let imageURLs: [String]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(imageURLs, id: \.self) { imageURL in
                    RemoteImage(url: imageURL)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(width: 200)
                }
            }
        }
    }
}

struct ImageCaroussel_Previews: PreviewProvider {
    static var previews: some View {
        ImageCaroussel(imageURLs: [
            "https://i.imgur.com/9fWdwNv.jpg",
            "https://live.staticflickr.com/8578/16655995541_7817565ea9_k.jpg",
            "https://farm3.staticflickr.com/2815/32761844973_4b55b27d3c_b.jpg",
            "https://farm9.staticflickr.com/8618/16649075267_d18cbb4342_b.jpg"
        ])
    }
}
