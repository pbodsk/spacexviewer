//
//  Launch.swift
//  SpaceXViewer
//
//  Created by Peter Bødskov on 05/04/2021.
//

import Foundation

struct Launch: Decodable {
    enum DatePrecision: String, Decodable {
        case half
        case quarter
        case year
        case month
        case day
        case hour
    }

    let flightNumber: Int
    let name: String
    let dateUTC: Date?
    let dateLocal: Date
    let datePrecision: DatePrecision
    let staticFireDateUTC: Date?
    let tdb: Bool?
    let net: Bool?
    let window: Int?
    let rocketID: String?
    let success: Bool
    let failures: [LaunchFailure]?
    let upcoming: Bool
    let details: String?
    let fairings: Fairings?
    let crewIDs: [String]
    let shipIDs: [String]
    let capsuleIDs: [String]
    let payloadIDs: [String]
    let launchPad: String?
    let cores: [Core]
    let links: LaunchLinks
    let autoUpdate: Bool

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case staticFireDateUTC = "static_fire_date_utc"
        case tdb
        case net
        case window
        case rocketID = "rocket"
        case success
        case failures
        case upcoming
        case details
        case fairings
        case crewIDs = "crew"
        case shipIDs = "ships"
        case capsuleIDs = "capsules"
        case payloadIDs = "payloads"
        case launchPad = "launchpad"
        case cores
        case links
        case autoUpdate = "auto_update"
    }
}

struct LaunchFailure: Decodable {
    let time: Int
    let altitude: Int?
    let reason: String
}

struct Fairings: Decodable {
    let reused: Bool?
    let recoveryAttempt: Bool?
    let recovered: Bool?
    let shipIDs: [String]

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered
        case shipIDs = "ships"
    }
}

struct Core: Decodable {
    let coreID: String
    let flight: Int
    let hasGridfins: Bool
    let hasLegs: Bool?
    let isReused: Bool?
    let landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType: String?
    let landpad: String?

    enum CodingKeys: String, CodingKey {
        case coreID = "core"
        case flight
        case hasGridfins = "gridfins"
        case hasLegs = "legs"
        case isReused = "reused"
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}

struct LaunchLinks: Decodable {
    let patch: LaunchPatchLinks
    let redditInfo: RedditInfo
    let flickInfo: FlickrInfo
    let presskit: URL?
    let webcast: URL?
    let youtubeID: String?
    let article: URL?
    let wikipedia: URL?

    enum CodingKeys: String, CodingKey {
        case patch
        case redditInfo = "reddit"
        case flickInfo = "flickr"
        case presskit
        case webcast
        case youtubeID = "youtube_id"
        case article
        case wikipedia
    }
}

struct LaunchPatchLinks: Decodable {
    let small: URL?
    let large: URL?
}

struct RedditInfo: Decodable {
    let campaignURL: URL?
    let launchURL: URL?
    let mediaURL: URL?
    let recoveryURL: URL?

    enum CodingKeys: String, CodingKey {
        case campaignURL = "campaign"
        case launchURL = "launch"
        case mediaURL = "media"
        case recoveryURL = "recovery"
    }
}

struct FlickrInfo: Decodable {
    let small: [URL]?
    let original: [URL]?
}
