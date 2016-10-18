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
    
    // substitute the key for the value that is contained within the method name
    func substituteKeyInMethod(method: String, key: String, value: String) -> String? {
        if method.range(of:"{\(key)}") != nil {
            return method.replacingOccurrences(of: "{\(key)}", with: value)
        } else {
            return nil
        }
    }
    

    func tumblrURL(withPathExtension: String) -> String {
        //URI Structure
        var components = URLComponents()
        
        components.scheme   = Constants.scheme
        components.host     = Constants.host
        components.path     = Constants.path + withPathExtension
        
        return components.url!.absoluteString
    }
    
    func convertToJSONObject(data: Data) -> [String: AnyObject]{
        
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
