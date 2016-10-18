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
    @IBOutlet weak var searchText: UITextField!
    
    //MAR: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchText.delegate = self
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
    }
    
    //MAR: UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //constantly keep searching with the addition of new chars
        let oldText = textField.text! as NSString
        
        var newText = oldText.replacingCharacters(in: range, with: string)

        print(newText)
        
        var parameters = [ParameterKeys.ApiKey: ParameterValues.ApiKey, ParameterKeys.Tag: newText] as [String : Any]
        
        //Request call to /tagged with search tags
        oauth1swift?.client.request(TMClient.sharedInstance().tumblrURL(withPathExtension: Methods.Tagged), method: .GET, parameters: parameters, headers: nil, success: {
            (data, error) in
            let json = TMClient.sharedInstance().convertToJSONObject(data: data)
            
            print(json)
            
            }, failure: {
                error in
                
                print(error)
                
                print("\(TMClient.sharedInstance().tumblrURL(withPathExtension: Methods.Tagged))\(parameters)")
        })

        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
