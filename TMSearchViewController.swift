//
//  TMSearchViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMSearchViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    var oauth1swift: OAuth1Swift? = nil
    
    //MARK: IBOutlets
    
    
    //MAR: Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
    }
    
    //MAR: UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        
        var newText = oldText.replacingCharacters(in: range, with: string)
        
        print(newText)
        
        let parameters = [String:Any!]()
        
        oauth1swift?.client.request(TMClient.sharedInstance().tumblrURL(withPathExtension: Methods.PostText), method: .POST, parameters: parameters, headers: nil, success: {
            (data, error) in
            let json = TMClient.sharedInstance().convertToJSONObject(data: data)
            
            }, failure: {
                error in
                print(error)
        })
        
        return true
    }
    
}
