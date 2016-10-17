//
//  TMConstants.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit

struct Constants {
    //MARK: Credentials
    static let ConsumerKey = "Y1rZXHptROHv4rGJFGdfbPVkakE2HXPwjd3wRpnjrJeUPyRiIr"

    //MARK: Authentication
    static let RequestToken = "https://www.tumblr.com/oauth/request_token"
    static let Authorize = "https://www.tumblr.com/oauth/authorize"
    static let AccessToken = "https://www.tumblr.com/oauth/access_token"
    
    //MARK: Request
    static let RequestURL = "https://api.tumblr.com/v2"
    
    //MARK: URL Components
    static let scheme = "https"
    static let host = "api.tumblr.com"
    static let path = "/v2"
}


struct Methods {
    //GET
    static let BlogFollowers = "/blog/{blog-identifier}/followers"
    static let Tagged = "/tagged"
    static let UserInfo = "/user/info"
    static let UserDashboard = "/user/dashboard"
    
    //POST
    static let PostText = "/blog/idelfonsog2.tumblr.com/post"
}

struct ParameterKeys {
    //Include when required
    static let ApiKey = "api_key"
    
    //Search method
    static let Tag = "tag"
    
    //Post blog
    static let BlogType = "type"
    static let BlogState = "state"
    //Text Post
    static let Title = "title"
    
}

struct ParameterValues {
    //General include when required
    static let ApiKey = "JbdFQBF6QQUILBRXhVgc2PKOhWs3mGMfi57KswESEUoC1z1Hls"
    
    //Blog Post Types
    static let TextType = "text"
    static let PhotoType = "photo"
    static let QuoteType = "quote"
    static let LinkType = "link"
    static let ChatType = "chat"
    static let AudioType = "audio"
    static let VideoType = "video"
    
    
}



