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
        
        let usersBlogURL = self.getBlogUrl(url: (blog?.url)!)
        
        //Query Params for /user/foloww
        let parameters = [
            ParameterKeys.URL: usersBlogURL,
            ParameterKeys.ApiKey: ParameterValues.ApiKey
            ]
        
        print("\(session.tumblrURL(Methods.FollowUser))\(parameters)")
        
        let _ = oauth1swift?.client.request(session.tumblrURL(Methods.FollowUser), method: .POST, parameters: parameters, headers: nil, success: {
                (data, error) in
            
            let json = self.session.convertToJSONObject(data)
            
            DispatchQueue.main.async {
                self.displayAlert("Following user")
                self.dismiss(animated: true, completion: nil)
            }
            
            }, failure: { error in
                print(error)
        })
        
    }
    
    @IBAction func unfollowUser(_ sender: AnyObject) {
        
    }
    
    

    //MARK: Alert
    
    func displayAlert(_ text: String) {
        
        let alert = UIAlertController(title: "Result", message: text, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //Decompose the URL from search results
    func getBlogUrl(url: String) -> String {
        
        let scheme      = URL(string: url)?.scheme
        let host        = URL(string: url)?.host
        
        return "\(scheme!)://\(host!)"
    }

}
