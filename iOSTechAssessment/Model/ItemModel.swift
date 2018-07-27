//
//  ItemModel.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import Foundation

struct Item: Codable {
    
    let url: String?
    let keywords: String?
    let column: String?
    let section: String?
    let byline: String?
    let type: String?
    let title: String?
    var abstract: String?
    let publishedDate: String?
    let source: String?
    let id: Double?
    let assetId: Double?
    let views: Int?
    
    let desFacet: [String]?
    let orgFacet: [String]?
    let perFacet: [String]?
    let geoFacet: [String]?
    
    let mediaItems: [MediaItem]?
    
    //Item coding keys
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case keywords = "adx_keywords"
        case column = "column"
        case section = "section"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        
        case publishedDate = "published_date"
        case source = "source"
        case id = "id"
        case assetId = "asset_id"
        case views = "views"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case mediaItems = "media"
    }
    
    public init(from decoder: Decoder) throws {
        let container     = try decoder.container(keyedBy: CodingKeys.self)
        url               = try container.decode(String.self, forKey: .url)
        keywords          = try container.decode(String.self, forKey: .keywords)
        column            = try container.decodeIfPresent(String.self, forKey: .column)
        section           = try container.decode(String.self, forKey: .section)
        byline            = try container.decode(String.self, forKey: .byline)
        type              = try container.decode(String.self, forKey: .type)
        title             = try container.decode(String.self, forKey: .title)
        abstract          = try container.decode(String.self, forKey: .abstract)
        publishedDate     = try container.decode(String.self, forKey: .publishedDate)
        
        source            = try container.decode(String.self, forKey: .source)
        id                = try container.decode(Double.self, forKey: .id)
        assetId           = try container.decode(Double.self, forKey: .assetId)
        views             = try container.decode(Int.self, forKey: .views)
        abstract          = try container.decode(String.self, forKey: .abstract)
        mediaItems        = try container.decode([MediaItem].self, forKey: .mediaItems)
        
        
        let dFacet        = try? container.decodeIfPresent([String].self, forKey: .desFacet)
        let oFacet        = try? container.decodeIfPresent([String].self, forKey: .orgFacet)
        let pFacet        = try? container.decodeIfPresent([String].self, forKey: .perFacet)
        let gFacet        = try? container.decodeIfPresent([String].self, forKey: .geoFacet)
        
        
        if let dF = dFacet { desFacet = dF } else { desFacet = [] }
        if let oF = oFacet { orgFacet = oF } else { orgFacet = [] }
        if let pF = pFacet { perFacet = pF } else { perFacet = [] }
        if let gF = gFacet { geoFacet = gF } else { geoFacet = [] }
        
    }
}
