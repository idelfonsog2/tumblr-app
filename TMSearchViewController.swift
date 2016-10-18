//
//  TMSearchViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMSearchViewController: UIViewController {
    
    //MARK: Properties
    var oauth1swift: OAuth1Swift? = nil
    
    //MARK: IBOutlets
    
    
    //MARK: Delegates
    var searchTextFieldDelegate = SearchTextFieldDelegate()
    
    //MAR: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
        
        oauth1swift!.client.request(
            TMClient.sharedInstance().tumblrURL(withPathExtension: Methods.UserInfo),
            method: .GET,
            success: {
                data, response in
                let json = TMClient.sharedInstance().convertToJSONObject(data: data)
//                print(json)
            },
            failure: {
                error in
                print(error)
        })
    }
}
