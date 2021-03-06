//
//  TMClient.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMClient: NSObject {
    
    //MARK: Properties
    var oauth1swift: OAuthSwift?    = nil
    var authToken: String?          = nil
    var oauthTokenSecret: String?   = nil
    
    
    // MARK: Helpers
    
    func tumblrURL(_ withPathExtension: String) -> String {
        //URI Structure
        var components = URLComponents()
        
        components.scheme   = Constants.scheme
        components.host     = Constants.host
        components.path     = Constants.path + withPathExtension
        
        return components.url!.absoluteString
    }
    
    func convertToJSONObject(_ data: Data) -> [String: AnyObject]{
        
        var parsedResult: Any!
        
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
        } catch {
            print("Could not parse data to JSON")
        }
        
        return parsedResult as! [String : AnyObject]
    }
    
    // MARK: Shared Instance
    
    class func sharedInstance() -> TMClient {
        struct Singleton {
            static var sharedInstance = TMClient()
        }
        return Singleton.sharedInstance
    }



    
}
