//
//  Dragon.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 03/04/2021.
//

import Foundation

struct Dragon: Decodable {

    let name: String
    let type: String
    let active: Bool
    let crewCapacity: Int
    let sidewallAngleDegree: Int
    let orbitDurationYear: Int
    let dryMassInKilos: Int
    let dryMassInPounds: Int
    let firstFlight: String
    let heatShield: HeatShield
    let thrusters: [Thruster]?
    let launchPayloadMass: MeasurementMass?
    let launchPayloadVolume: MeasurementVolume?
    let returnPayloadMass: MeasurementMass?
    let returnPayloadVolume: MeasurementVolume?
    let pressurizedCapsule: PressurizedCapsule?
    let trunk: Trunk?
    let heightTrunk: MeasurementDistance?
    let diameter: MeasurementDistance?
    let flickrImages: [String]?
    let wikipedia: String?
    let description: String?


    enum CodingKeys: String, CodingKey {
        case name
        case type
        case active
        case crewCapacity = "crew_capacity"
        case sidewallAngleDegree = "sidewall_angle_deg"
        case orbitDurationYear = "orbit_duration_yr"
        case dryMassInKilos = "dry_mass_kg"
        case dryMassInPounds = "dry_mass_lb"
        case firstFlight = "first_flight"
        case heatShield = "heat_shield"
        case thrusters
        case launchPayloadMass = "launch_payload_mass"
        case launchPayloadVolume = "launch_payload_vol"
        case returnPayloadMass = "volume_payload_mass"
        case returnPayloadVolume = "volume_payload_vol"
        case pressurizedCapsule = "pressurized_capsule"
        case trunk
        case heightTrunk = "height_w_trunk"
        case diameter
        case flickrImages = "flickr_images"
        case wikipedia
        case description

    }
}

struct HeatShield: Decodable {
    let material: String
    let sizeInMeters: Float
    let temperatureInDegrees: Int?
    let developmentPartner: String?

    enum CodingKeys: String, CodingKey {
        case material
        case sizeInMeters = "size_meters"
        case temperatureInDegrees = "temp_degrees"
        case developmentPartner = "dev_partner"
    }
}

struct Thruster: Decodable {
    let type: String
    let amount: Int
    let pods: Int
    let fuel1: String
    let fuel2: String
    let isp: Int
    let thrust: Thrust

    enum CodingKeys: String, CodingKey {
        case type
        case amount
        case pods
        case fuel1 = "fuel_1"
        case fuel2 = "fuel_2"
        case isp
        case thrust
    }
}

struct Thrust: Decodable {
    let kN: Double
    let lbf: Int
}

struct PressurizedCapsule: Decodable {
    let payloadVolume: MeasurementVolume?

    enum CodingKeys: String, CodingKey {
        case payloadVolume = "payload_volume"
    }
}

struct Trunk: Decodable {
    let trunkVolume: MeasurementVolume?
    let cargo: Cargo

    enum CodingKeys: String, CodingKey {
        case trunkVolume = "trunk_volume"
        case cargo
    }
}

struct Cargo: Decodable {
    let solarArray: Double?
    let isUnpressurizedCargo: Bool

    enum CodingKeys: String, CodingKey {
        case solarArray = "solar_array"
        case isUnpressurizedCargo = "unpressurized_cargo"
    }
}

struct MeasurementMass: Decodable {
    let kg: Double?
    let lb: Double?
}

struct MeasurementVolume: Decodable {
    let cubicMeters: Double?
    let cubicFeet: Double?

    enum CodingKeys: String, CodingKey {
        case cubicMeters = "cubic_meters"
        case cubicFeet = "cubic_feet"
    }
}

struct MeasurementDistance: Decodable {
    let meters: Double?
    let feet: Double?
}
