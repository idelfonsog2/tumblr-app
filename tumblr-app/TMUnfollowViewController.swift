//
//  TMUnfollowViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/21/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMUnfollowViewController: UIViewController {

    //MARK: Properties
    var blog: [String:AnyObject]?
    var oauth1swift: OAuth1Swift? = nil
    var session = TMClient.sharedInstance()
    
    //MARK: IBOutlets
    @IBOutlet weak var blogName: UILabel!
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: IBAction
    @IBAction func unfollowUser(_ sender: AnyObject) {
        guard let url = blog?["url"] as? String  else{
            print("no 'url' key found")
            return
        }
        
        //Query para
        let parameters = [
            ParameterKeys.ApiKey: ParameterValues.ApiKey,
            ParameterKeys.URL: url
        ]
        
        //POST request
        let _ = oauth1swift?.client.request(session.tumblrURL(Methods.UnfollowUser), method: .POST, parameters: parameters, headers: nil, success: {
             (data, error) in
            
            let json = self.session.convertToJSONObject(data)
            print(json)
            
            }, failure: {
                (error) in
                print("Error making the POST reques to /user/unfollow")
                print(error)
        })
        
    }

    @IBAction func dismissViewController(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MAR: Notifications
    func displayAlert(_ text: String) {
        
        let alert = UIAlertController(title: "Result", message: text, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }

}
