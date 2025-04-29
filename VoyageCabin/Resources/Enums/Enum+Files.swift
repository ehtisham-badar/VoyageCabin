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

enum HearAbout: String {
    case insta = "Instagram"
    case tiktok = "TikTok"
    case facebook = "Facebook"
    case google = "Google Search"
    case appstore = "App Store"
    case friendsorfamily = "Friends or Family"
}

enum ChoosePlace: String {
    case budget = "Budget"
    case location = "Location"
    case lifestyle = "Lifestyle match"
    case furnished = "Furnished vs. Unfurnished"
    case closeto = "Close to transport"
}

enum SelectAge: String {
    case a_18_24 = "18-24"
    case a_25_34 = "25-34"
    case a_35_44 = "35-44"
    case a_45_plus = "45+"
}

enum WeeklyBudget: String {
    case under200 = "Under $200"
    case w_200_350 = "$200 - $350"
    case w_350_500 = "$350 - $500"
    case w_500_plus = "$500 +"
}

enum FindChallenge: String {
    case notgetting = "Not getting enough responses"
    case myprofile = "My profile gets lost in search results"
    case uncertain = "Uncertain who is interested in my profile"
    case overwhelm = "Overwhelmed by too many listings"
}
