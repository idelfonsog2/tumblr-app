//
//  TMDetailBlogViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/19/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMDetailBlogViewController: UIViewController {
    
    //MARK: Properties
    var blog: TMBlog?
    var oauth1swift: OAuth1Swift? = nil
    var session = TMClient.sharedInstance()

    //MARK: IBOutlets
    @IBOutlet weak var blogNameLabel: UILabel!
    @IBOutlet weak var unfollowButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions

    @IBAction func followUser(_ sender: AnyObject) {
        
        //Query Params for /user/foloww
        let parameters = [
            ParameterKeys.URL: blog?.url,
            ParameterKeys.ApiKey: ParameterValues.ApiKey
            ]
        
        let _ = oauth1swift?.client.request(session.tumblrURL(Methods.FollowUser), method: .GET, success: {
                (data, error) in
            
            let json = self.session.convertToJSONObject(data)
            print(json)
        
            }, failure: { error in
                print(error)
        })
        
    }
    
    @IBOutlet weak var unfollowUser: UIButton!
    

}
