//
//  LoginViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift


class LoginViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var debugLabel: UILabel!
    

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: IBActions
    @IBAction func loginWithTumblr(_ sender: AnyObject) {
        self.loginWithOauth()
    }
    
    //MARK: Alerts
    func presentAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Helpers
    
    fileprivate func loginWithOauth() {
        //Set OAuth
        let oauth1swift = OAuth1Swift(
            consumerKey: Constants.ConsumerKey,
            consumerSecret: Constants.ApiKey,
            requestTokenUrl: Constants.RequestToken,
            authorizeUrl: Constants.Authorize,
            accessTokenUrl: Constants.AccessToken)
        
        TMClient.sharedInstance().oauth1swift = oauth1swift
        
        //Make Authorization request
        oauth1swift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauth1swift)
        
        oauth1swift.authorize(withCallbackURL: "tumblr-app://oauth-callback", success: { (credential, response, parameter) in
            print(credential.oauthToken)
            print(credential.oauthTokenSecret)
            
            oauth1swift.client.request(
                TMClient.sharedInstance().tumblrURL(Methods.UserInfo),
                method: .GET,
                success: { data, response in
                    let json = TMClient.sharedInstance().convertToJSONObject(data)
                    print(json)
                    
                }, failure: {
                    error in
                    print(error)
            })
            
            //present navigation view controller modally
            self.openNavigationView()
            }, failure: { (error) in
                self.presentAlert("Error", message: "User has cancel approval")
                print(error)
        })
    }
    
    
    func openNavigationView() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ManagerNavigationController") as! UINavigationController
        self.present(controller, animated: true, completion: nil)
    }
    
    
    

}

