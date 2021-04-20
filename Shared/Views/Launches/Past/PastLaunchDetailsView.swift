//
//  PastLaunchDetailsView.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 20/04/2021.
//

import SwiftUI

struct PastLaunchDetailsView: View {
    var launch: Launch
    var body: some View {
        VStack(alignment: .leading) {
            if let rocketID = launch.rocketID {
                HeaderContentTextView(header: "Rocket ID", content: rocketID)
            }


            HStack {
                Text("Success")
                    .bold()
                    .frame(width: 200, alignment: .leading)
                Image(systemName: launch.success ? "checkmark" : "exclamationmark")
            }
            /*
            HeaderContentTextView(header: "Crew Capacity", content: "\(dragon.crewCapacity)")
            HeaderContentTextView(header: "Sidewall Angle in Degrees", content: "\(dragon.sidewallAngleDegree)")
            HeaderContentTextView(header: "Orbital Duration Years", content: "\(dragon.orbitDurationYear)")
            HeaderContentTextView(header: "Dry Mass in kg", content: "\(dragon.dryMassInKilos)")
            HeaderContentTextView(header: "Dry Mass in pounds", content: "\(dragon.dryMassInPounds)")
 */
        }        
    }
}

struct PastLaunchDetailsView_Previews: PreviewProvider {
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
        PastLaunchDetailsView(launch: launch)
    }
}
