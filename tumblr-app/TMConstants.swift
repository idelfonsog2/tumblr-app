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
    static let SecretKey = "JbdFQBF6QQUILBRXhVgc2PKOhWs3mGMfi57KswESEUoC1z1Hls"

    static let RequestToken = "https://www.tumblr.com/oauth/request_token"
    static let Authorize = "https://www.tumblr.com/oauth/authorize"
    static let AccessToken = "https://api.tumblr.com/oauth/access_token"
    
    static let scheme = "https"
    static let tumblrRequestTokenHost = "tumblr.com"
    static let host = "api.tumblr.com"
    static let path = "/v2"
}

struct Methods {
    static let BlogFollowers = "/blog/{blog-identifier}/followers"
}



