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
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(TMEditBlogViewController.postBlog))
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
    }
    
    //MARK: Actions
    func postBlog() {
        print(oauth1swift?.parameters)
        let headers = ["Accept": "application/json", "Content-Type":"application/json"]
        let parameters = [ParameterKeys.BlogType:ParameterValues.TextType]
        
        oauth1swift?.client.post(Methods.PostText, parameters: parameters , headers: headers, body: <#T##Data?#>, success: <#T##OAuthSwiftHTTPRequest.SuccessHandler?##OAuthSwiftHTTPRequest.SuccessHandler?##(Data, HTTPURLResponse) -> Void#>, failure: <#T##OAuthSwiftHTTPRequest.FailureHandler?##OAuthSwiftHTTPRequest.FailureHandler?##(OAuthSwiftError) -> Void#>)
    }
    
    //MARK: Helpers
    func displayStatus() {
        //Status from the post update
    }


}
