//
//  Cachemanager.swift
//  youtube-onedaybuild
//
//  Created by Graham Russell on 04/01/2021.
//

import Foundation


class CacheManager {

    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        // Store the image data and use the url as the key
        cache[url] = data
    }
    static func getVideoCache(_ url:String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
        
    }
    
    
}