//
//  TMClient.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit

class TMClient: NSObject {
    
    let session = URLSession.shared
    
    var requestToken: String?
    var sessionID: String?
    var userID: Int?
    
    // MARK: Helpers
    
    // substitute the key for the value that is contained within the method name
    func substituteKeyInMethod(method: String, key: String, value: String) -> String? {
        if method.range(of:"{\(key)}") != nil {
            return method.replacingOccurrences(of: "{\(key)}", with: value)
        } else {
            return nil
        }
    }
    

    //MARK: Tumblr API endpoint
    func tumblrURL(withPathExtension: String? = nil) -> URL {
        //URI Structure
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.host
        components.path = Constants.path + withPathExtension!
        
        return components.url!
    }
    
}
