//
//  LoginViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class LoginViewController: OAuthWebViewController {

    //MARK: IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var debugLabel: UILabel!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //MARK: IBActions
    @IBAction func loginWithTumblr(_ sender: AnyObject) {
        //Set OAuth
        let oauthswift = OAuth1Swift(
            consumerKey: Constants.ConsumerKey,
            consumerSecret: Constants.SecretKey,
            requestTokenUrl: Constants.RequestToken,
            authorizeUrl: Constants.Authorize,
            accessTokenUrl: Constants.AccessToken)
        
        //Make request
        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)

        oauthswift.authorize(withCallbackURL: "tumblr-app://oauth-callback", success: { (credential, response, parameter) in
            print(response)
            print(parameter.count)
            print(parameter)
            self.presentAlert(title: "Success", message: credential.oauthToken)
            }, failure: { (error) in
                self.debugLabel.text = error.localizedDescription
                print(error)
        })
        
        let parameters = [
        o
        oauthswift.client.get(<#T##urlString: String##String#>, parameters: <#T##OAuthSwift.Parameters#>, headers: <#T##OAuthSwift.Headers?#>, success: <#T##OAuthSwiftHTTPRequest.SuccessHandler?##OAuthSwiftHTTPRequest.SuccessHandler?##(Data, HTTPURLResponse) -> Void#>, failure: <#T##OAuthSwiftHTTPRequest.FailureHandler?##OAuthSwiftHTTPRequest.FailureHandler?##(OAuthSwiftError) -> Void#>)
        
        
        
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }


}

