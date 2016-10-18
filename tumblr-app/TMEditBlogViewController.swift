//
//  TMEditBlogViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMEditBlogViewController: UIViewController {

    //MAR: Properties
    var oauth1swift: OAuth1Swift? = nil
    
    //MARK: IBOutlets
    @IBOutlet weak var textBlog: UITextView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(TMEditBlogViewController.postTextBlog))
        
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
    }
    
    //MARK: Actions
    func postTextBlog() {
       
        print(oauth1swift?.parameters)
        
        let headers = ["Accept": "application/json", "Content-Type":"application/json"]
        
        let parameters = [ParameterKeys.BlogType:ParameterValues.TextType, ParameterKeys.Body:textBlog.text] as [String : Any]
        
        
        oauth1swift?.client.post(Methods.PostText, parameters: parameters , headers: headers, body: nil, success: {
                (data, error) in
                let json = TMClient.sharedInstance().convertToJSONObject(data: data)
                let vody = 
            self.displayAlert(text: )
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
    }
}
