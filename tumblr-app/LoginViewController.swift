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
                self.tumblrURL(withPathExtension: Methods.UserInfo),
                method: .GET,
                success: { data, response in
//                    let dataString = String(data: data, encoding: String.Encoding.utf8)
//                    print(dataString)
                    var json = self.convertToJSONObject(data: data)
                    print(json)
                    
                }, failure: {
                    error in
                    print(error)
            })
            
            //present navigation view controller modally
            self.openNavigationView()
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
    
    
    func openNavigationView() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TMNavigationViewController") as! TMNavigationViewController
        
        self.present(controller, animated: true, completion: nil)
    }
    
    //MARK: Tumblr API endpoint
    func tumblrURL(withPathExtension: String) -> String
    {
        //URI Structure
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.host
        components.path = Constants.path + withPathExtension
        
        return components.url!.absoluteString
    }
    
    func convertToJSONObject(data: Data) -> [String:AnyObject] {
        
        var parsedResult: Any!
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
        } catch {
            print("Could not parse JSON data")
        }
        
        return parsedResult as! [String : AnyObject]
    }
    

}

