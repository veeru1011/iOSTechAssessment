//
//  MediaItem.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import Foundation

struct MediaItem: Codable {
    let type: String?
    let subtype: String?
    let caption: String?
    let copyright: String?
    let metadata: [MetaDataItem]?
    
    //MediaItem coding keys
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case metadata = "media-metadata"
    }
}

struct MetaDataItem: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}
