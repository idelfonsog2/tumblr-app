//
//  TMNavigationViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMNavigationViewController: UIViewController  {
    
    //MARK: Properties
    var oauth1swift: OAuth1Swift!
    
    //MARK: IBOutlets
    @IBAction func dismissButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MAR: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oauth1swift.client.request(
            TMClient.sharedInstance().tumblrURL(withPathExtension: Methods.UserInfo),
            method: .GET,
            success: {
                data, response in
                let json = TMClient.sharedInstance().convertToJSONObject(data: data)
                print(json)
                
            },
            failure: {
                error in
                print(error)
        })
        

    }
    
}
