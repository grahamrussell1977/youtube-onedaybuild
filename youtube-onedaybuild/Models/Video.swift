//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Graham Russell on 02/01/2021.
//

import Foundation


struct Video : Decodable {
    
    var videoID = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum  CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoID
        
    }
    
    init (from decoder: Decoder) throws {
    
        let container = try decoder.container(keyedBy: CodingKeys.self)
       
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
    
        // Parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnails
        _ = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // parse videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoID = try resourceIdContainer.decode(String.self, forKey: .videoID)
    }
    
}
