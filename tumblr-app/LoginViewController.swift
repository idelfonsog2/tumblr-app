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

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginWithTumblr(_ sender: AnyObject) {
        
        
        let oauthswift = OAuth1Swift(
            consumerKey: Constants.ConsumerKey,
            consumerSecret: Constants.SecretKey,
            requestTokenUrl: Constants.RequestToken,
            authorizeUrl: Constants.Authorize,
            accessTokenUrl: Constants.AccessToken)
        
        oauthswift.authorize(withCallbackURL: "tumblr-app://oauth-callback", success: { (credential, response, parameter) in
            print(credential.oauthToken)
            print(credential.oauthTokenSecret)
            print(parameter["user_id"])
            }, failure: { (error) in print(error.localizedDescription) })
    }
    
    func presentAler(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    


}

