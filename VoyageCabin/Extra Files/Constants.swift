//
//  Constants.swift
//  VoyageCabin
//
//  Created by APPLE on 29/04/2025.
//

import Foundation
import UIKit

class Constants{
    static var selectedStatus: HouseSearchStatus?
    static var APP_NAME = "Voyage Cabin"
    static var lookingForAPlaceBody = LookingForPlace(device_id: deviceId, urgency: "", type_of_listing: "", where_did_you_hear: "", what_matters: [], age_range: "", weekly_budget: "", biggest_challenge: [])
    static var lookingForHousemate = LookingForHousemate(device_id: deviceId, type_of_listing: "", where_did_you_hear: "", what_matters: [], had_trouble: false, age_range: "", biggest_challenge: [])
    static var deviceId: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    static var GOOGLE_MAPS_API_KEY = "AIzaSyAvtzO5f_NlXehIQoR0WswOPitszvk--eQ"
}
