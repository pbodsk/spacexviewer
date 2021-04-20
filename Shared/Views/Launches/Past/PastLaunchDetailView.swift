//
//  PastLaunchDetailView.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 20/04/2021.
//

import SwiftUI

struct PastLaunchDetailView: View {
    var launch: Launch

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                Header(title: launch.name)
                Text("(" + dateFormatter.string(from: launch.dateLocal) + ")")
                    .font(.footnote)
            }

            if let details = launch.details {
                Text(details)
                    .padding(.bottom, 10)
            }

            PastLaunchDetailsView(launch: launch)
        }
        .frame(minWidth: 300,
               maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               minHeight: 300,
               maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: .topLeading
        )
        .padding(.all)
    }
}

struct PastLaunchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let launch = Launch(
            flightNumber: 1,
            name: "FalconSat",
            dateUTC: nil,
            dateLocal: Date(),
            datePrecision: .day,
            staticFireDateUTC: nil,
            tdb: false,
            net: false,
            window: 1,
            rocketID: "rocketID",
            success: true, failures: nil,
            upcoming: false,
            details: "Details",
            fairings: nil,
            crewIDs: ["1", "2", "3"],
            shipIDs: ["4", "5", "6"],
            capsuleIDs: ["7", "8", "9"],
            payloadIDs: ["10", "11", "12"],
            launchPad: "launchPad",
            cores: [Core(
                        coreID: "coreID",
                        flight: 1,
                        hasGridfins: false,
                        hasLegs: false,
                        isReused: true,
                        landingAttempt: true,
                        landingSuccess: true,
                        landingType: "sea",
                        landpad: "launchPad")
            ],
            links: LaunchLinks(
                patch: LaunchPatchLinks(
                    small: nil,
                    large: nil
                ),
                redditInfo: RedditInfo(
                    campaignURL: nil,
                    launchURL: nil,
                    mediaURL: nil,
                    recoveryURL: nil
                ),
                flickInfo: FlickrInfo(
                    small: nil,
                    original: nil
                ),
                presskit: nil,
                webcast: nil,
                youtubeID: nil,
                article: nil,
                wikipedia: nil
            ),
            autoUpdate: true)
        PastLaunchDetailView(launch: launch)
    }
}
