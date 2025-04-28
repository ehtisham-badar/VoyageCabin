//
//  Enum+Files.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import Foundation

enum HouseSearchStatus: String {
    case lookingForAPlace = "I’m looking for a place"
    case needAHousemate = "I need a housemate"
}

enum UrgencyStatus: String {
    case immediately = "Immediately"
    case withinmonth = "Within a month"
    case justbrowsing = "Just browsing"
}

enum ListingStatus: String {
    case privaterooms = "Private room(s)"
    case entireproperty = "Entire Property"
    case studentacc = "Student Accommodation"
    case hostfamily = "Host-family stay"
}
