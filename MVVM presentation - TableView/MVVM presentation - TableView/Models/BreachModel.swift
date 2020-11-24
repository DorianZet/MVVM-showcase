//
//  BreachModel.swift
//  MVVM presentation - TableView
//
//  Created by Mateusz Zacharski on 22/11/2020.
//

import Foundation

struct BreachModel : Codable { // The model contains properties of a single JSON data object from haveibeenpwned API.
    
    let name : String
    let title : String
    let domain : String
    let breachDate : String
    var breachDateformatted: String? { return usDateToUK(breachDate) }
    let addedDate : String
    let modifiedDate : String
    let pwnCount : Int
    let description: String
    let logoPath : String
    let dataClasses : [String]
    let verified: Bool
    let fabricated : Bool
    let sensitive : Bool
    let retired : Bool
    let spam : Bool
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case title = "Title"
        case domain = "Domain"
        case breachDate = "BreachDate"
        case addedDate = "AddedDate"
        case modifiedDate = "ModifiedDate"
        case pwnCount = "PwnCount"
        case description = "Description"
        case logoPath = "LogoPath"
        case dataClasses = "DataClasses"
        case verified = "IsVerified"
        case fabricated = "IsFabricated"
        case sensitive = "IsSensitive"
        case retired = "IsRetired"
        case spam = "IsSpamList"
    }
    
    func usDateToUK(_ inpDate: String) -> String {
        let dateAsString = inpDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        if let date = dateFormatter.date(from: dateAsString) {
            dateFormatter.dateFormat = "dd-MMM-yyyy"
            let outputDate = dateFormatter.string(from: date)
            return outputDate
        }
        return inpDate
    }
}
