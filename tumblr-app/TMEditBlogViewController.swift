//
//  TMEditBlogViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMEditBlogViewController: UIViewController, UITextFieldDelegate {

    //MAR: Properties
    var oauth1swift: OAuth1Swift? = nil
    
    //MARK: IBOutlets
    @IBOutlet weak var textBlog: UITextView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
    }
    
    //MARK: Actions
    @IBAction func postTextBlog(_ sender: AnyObject) {
        let headers = ["Content-Type":"application/json; charset=utf-8"]
        
        let parameters = [
            ParameterKeys.ApiKey: ParameterValues.ApiKey,
            ParameterKeys.BlogType: ParameterValues.TextType,
            ParameterKeys.BlogFormat: ParameterValues.MarkdownType,
            ParameterKeys.Body: textBlog.text
        ] as [String : Any]
        
        oauth1swift?.client.request(TMClient.sharedInstance().tumblrURL(withPathExtension: Methods.PostText), method: .POST, parameters: parameters, headers: nil, success: {
            (data, error) in
            let json = TMClient.sharedInstance().convertToJSONObject(data: data)
            print(json)
            
            }, failure: {
                error in
                print(error)
        })

    }

    
    //MARK: Helpers
    func displayStatus() {
        //Status from the post update
    }

    
    //MARK: Alert

    func displayAlert(text: String) {
        let alert = UIAlertController(title: "Result", message: text, preferredStyle: .actionSheet)
        self.present(alert, animated: true, completion: nil)
    }
}
