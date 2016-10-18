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
    static let ConsumerKey      = "Y1rZXHptROHv4rGJFGdfbPVkakE2HXPwjd3wRpnjrJeUPyRiIr"
    static let ApiKey           = "JbdFQBF6QQUILBRXhVgc2PKOhWs3mGMfi57KswESEUoC1z1Hls"
    
    //MARK: Authentication
    static let RequestToken     = "https://www.tumblr.com/oauth/request_token"
    static let Authorize        = "https://www.tumblr.com/oauth/authorize"
    static let AccessToken      = "https://www.tumblr.com/oauth/access_token"
    
    //MARK: Request
    static let RequestURL       = "https://api.tumblr.com/v2"
    
    //MARK: URL Components
    static let scheme   = "https"
    static let host     = "api.tumblr.com"
    static let path     = "/v2"
}


struct Methods {
    //GET
    static let BlogFollowers    = "/blog/{blog-identifier}/followers"
    static let Tagged           = "/tagged"
    static let UserInfo         = "/user/info"
    static let UserDashboard    = "/user/dashboard"
    
    //POST
    static let PostText = "/blog/idelfonsog2.tumblr.com/post"
}

struct ParameterKeys {
    //Include when required
    static let ApiKey   = "api_key"
    
    //Search method
    static let Tag  = "tag"     // *req
    
    //MARK: Blog Param Keys
    
    //Post blog
    static let BlogType     = "type"    // *req
    static let BlogState    = "state"
    static let BlogTags     = "tags"
    static let BlogFormat   = "format"
    static let BlogSlug     = "slug"
    
    //Text Post
    static let Title    = "title"
    static let Body     = "body"    // *req
    
    //Photo Post
    static let Caption  = "caption"
    static let Link     = "link"
    static let Source   = "sourse"  // *req
    static let Data     = "data"    // *req
    static let Data64   = "data64"  // *req
    
    
}

struct ParameterValues {
    //API
    static let ApiKey = "JbdFQBF6QQUILBRXhVgc2PKOhWs3mGMfi57KswESEUoC1z1Hls"
    
    //Blog Post Type Values
    static let TextType     = "text"
    static let PhotoType    = "photo"
    static let QuoteType    = "quote"
    static let LinkType     = "link"
    static let ChatType     = "chat"
    static let AudioType    = "audio"
    static let VideoType    = "video"
        //Format Type
        static let HTMLType = "html"
        static let MarkdownType = "markdown"
}

struct ResponseKeys {
    static let Meta = "meta"
}



