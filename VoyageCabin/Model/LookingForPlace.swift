//
//  LookingForPlace.swift
//  VoyageCabin
//
//  Created by APPLE on 10/05/2025.
//

import Foundation

struct LookingForPlace: Codable {
    var device_id: String?
    var urgency: String?
    var type_of_listing: String?
    var where_did_you_hear: String?
    var what_matters: [String]?
    var age_range: String?
    var weekly_budget: String?
    var biggest_challenge: [String]?
}
