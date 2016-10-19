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
    var session = TMClient.sharedInstance()
    //MARK: IBOutlets
    @IBOutlet weak var textBlog: UITextView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
    }
    
    //MARK: Actions
    @IBAction func postTextBlog(_ sender: AnyObject) {
        
        //Query parameters for /post API call
        let parameters = [
            ParameterKeys.ApiKey: ParameterValues.ApiKey,
            ParameterKeys.BlogType: ParameterValues.TextType,
            ParameterKeys.BlogFormat: ParameterValues.MarkdownType,
            ParameterKeys.Body: textBlog.text
        ] as [String : Any]
        
        //POST Request
        let _ = oauth1swift?.client.request(session.tumblrURL(Methods.PostText), method: .POST, parameters: parameters, headers: nil, success: {
            (data, error) in
            let json = session.convertToJSONObject(data)
            
            guard let meta = json["meta"] as? [String:AnyObject] else {
                print("Did not fina 'meta' key in the parse json \(json)")
                return
            }

            guard let msg = meta["msg"] as? String else {
                print("Did not find a 'msg' key in the meta object")
                return
            }
            
            if msg == "Created" {
                self.displayAlert("Text Posted")
            }
            
            }, failure: {
                error in
                print(error)
        })

    }
      
    //MARK: Alert

    func displayAlert(_ text: String) {
        
        let alert = UIAlertController(title: "Result", message: text, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            result in
            
            print("ok")
            
            self.textBlog.text = ""
        })
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textBlog.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
