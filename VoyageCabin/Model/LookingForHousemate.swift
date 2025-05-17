//
//  LookingForHousemate.swift
//  VoyageCabin
//
//  Created by APPLE on 10/05/2025.
//

import Foundation

struct LookingForHousemate: Codable {
    var device_id: String?
    var type_of_listing: String?
    var where_did_you_hear: String?
    var what_matters: [String]?
    var had_trouble: Bool?
    var age_range: String?
    var biggest_challenge: [String]?
}
