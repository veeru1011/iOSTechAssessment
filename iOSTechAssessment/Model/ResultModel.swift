//
//  ResultModel.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import Foundation

struct ResultModel : Codable {
    let status: String?
    let copyright: String?
    let numberOfResults: Int?
    let results: [Item]?
    
    //Result  coding keys
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case copyright = "copyright"
        case numberOfResults = "num_results"
        case results = "results"
    }
}
