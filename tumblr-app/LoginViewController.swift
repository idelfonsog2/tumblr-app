//
//  LoginViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift
import SafariServices

class LoginViewController: UIViewController, SFSafariViewControllerDelegate {

    //MARK: IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var debugLabel: UILabel!
    
    //MARK: Properties
    var safari: SafariURLHandler?

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        safari?.delegate = self
    }

    //MARK: IBActions
    @IBAction func loginWithTumblr(_ sender: AnyObject) {
    
        //Set OAuth
        let oauth1swift = OAuth1Swift(
            consumerKey: Constants.ConsumerKey,
            consumerSecret: Constants.ApiKey,
            requestTokenUrl: Constants.RequestToken,
            authorizeUrl: Constants.Authorize,
            accessTokenUrl: Constants.AccessToken)
        
        //Make Authorization request
        oauth1swift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauth1swift)

        oauth1swift.authorize(withCallbackURL: "tumblr-app://oauth-callback", success: { (credential, response, parameter) in
            print(credential.oauthToken)
            print(credential.oauthTokenSecret)
            
            oauth1swift.client.request(
                TMClient.sharedInstance().tumblrURL(withPathExtension: Methods.UserInfo),
                method: .GET,
                success: { data, response in
                    let json = TMClient.sharedInstance().convertToJSONObject(data: data)
                    print(json)
                    
                }, failure: {
                    error in
                    print(error)
            })
            
            //present navigation view controller modally
            self.openNavigationView(authentication: oauth1swift)
            }, failure: { (error) in
                self.presentAlert(title: "Error", message: "User has cancel approval")
                print(error)
        })
        

    }
    
    //MARK: Alerts
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openNavigationView(authentication: OAuth1Swift) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TMNavigationViewController") as! TMNavigationViewController
        controller.oauth1swift = authentication
        self.present(controller, animated: true, completion: nil)
    }
    
    
    

}

