//
//  DragonGeneralInfoView.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 04/04/2021.
//

import SwiftUI

struct DragonGeneralInfoView: View {
    var dragon: Dragon
    var body: some View {
        VStack(alignment: .leading) {
            HeaderContentTextView(header: "Type", content: dragon.type.capitalized)
            HStack {
                Text("Active")
                    .bold()
                    .frame(width: 200, alignment: .leading)
                Circle()
                    .fill(dragon.active ? Color.green : Color.red)
                    .frame(width: 10, height: 10, alignment: .center)
            }
            HeaderContentTextView(header: "Crew Capacity", content: "\(dragon.crewCapacity)")
            HeaderContentTextView(header: "Sidewall Angle in Degrees", content: "\(dragon.sidewallAngleDegree)")
            HeaderContentTextView(header: "Orbital Duration Years", content: "\(dragon.orbitDurationYear)")
            HeaderContentTextView(header: "Dry Mass in kg", content: "\(dragon.dryMassInKilos)")
            HeaderContentTextView(header: "Dry Mass in pounds", content: "\(dragon.dryMassInPounds)")
        }
    }
}

struct DragonGeneralInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let dragon = Dragon(
            name: "Dragon 1",
            type: "capsule",
            active: true,
            crewCapacity: 0,
            sidewallAngleDegree: 15,
            orbitDurationYear: 2,
            dryMassInKilos: 4200,
            dryMassInPounds: 9300,
            firstFlight: "2010-12-08",
            heatShield: HeatShield(
                material: "PICA-X",
                sizeInMeters: 3.6,
                temperatureInDegrees: 3000,
                developmentPartner: "NASA"
            ),
            thrusters: [

            ],
            launchPayloadMass: MeasurementMass(
                kg: 6000.0,
                lb: 13228.0
            ),
            launchPayloadVolume: MeasurementVolume(
                cubicMeters: 25.0,
                cubicFeet: 883.0
            ),
            returnPayloadMass: nil,
            returnPayloadVolume: nil,
            pressurizedCapsule: PressurizedCapsule(
                payloadVolume: MeasurementVolume(
                    cubicMeters: 11.0,
                    cubicFeet: 388.0
                )
            ),
            trunk: Trunk(
                trunkVolume: MeasurementVolume(
                    cubicMeters: 14.0,
                    cubicFeet: 494.0
                ),
                cargo: Cargo(
                    solarArray: 2.0,
                    isUnpressurizedCargo: true
                )
            ),
            heightTrunk: MeasurementDistance(
                meters: 7.2,
                feet: 23.6
            ),
            diameter: MeasurementDistance(
                meters: 3.7,
                feet: 12.0
            ),
            flickrImages: [
                "https://i.imgur.com/9fWdwNv.jpg",
                "https://live.staticflickr.com/8578/16655995541_7817565ea9_k.jpg",
                "https://farm3.staticflickr.com/2815/32761844973_4b55b27d3c_b.jpg",
                "https://farm9.staticflickr.com/8618/16649075267_d18cbb4342_b.jpg"
            ],
            wikipedia: "https://en.wikipedia.org/wiki/SpaceX_Dragon",
            description: "Dragon is a reusable spacecraft developed by SpaceX, an American private space transportation company based in Hawthorne, California. Dragon is launched into space by the SpaceX Falcon 9 two-stage-to-orbit launch vehicle. The Dragon spacecraft was originally designed for human travel, but so far has only been used to deliver cargo to the International Space Station (ISS)."
        )

        DragonGeneralInfoView(dragon: dragon)
    }
}
