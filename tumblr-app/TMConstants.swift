//
//  TMConstants.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit

struct Constants {
    
    static let ConsumerKey = "Y1rZXHptROHv4rGJFGdfbPVkakE2HXPwjd3wRpnjrJeUPyRiIr"
    static let ApiKey = "JbdFQBF6QQUILBRXhVgc2PKOhWs3mGMfi57KswESEUoC1z1Hls"

    static let RequestToken = "https://www.tumblr.com/oauth/request_token"
    static let Authorize = "https://www.tumblr.com/oauth/authorize"
    static let AccessToken = "https://www.tumblr.com/oauth/access_token"
    
    static let AuthorizationHeader = "Authorization"
    
    static let RequestURL = "https://api.tumblr.com/v2"
    
    static let scheme = "https"
    static let host = "api.tumblr.com"
    static let path = "/v2"
}


struct Methods {
    static let BlogFollowers = "/blog/{blog-identifier}/followers"
    static let Tagged = "/tagged"
    static let UserInfo = "/user/info"
    static let UserDashboard = "/user/dashboard"
    
}

struct ParameterKeys {
    static let Tag = "tag"
    
}



