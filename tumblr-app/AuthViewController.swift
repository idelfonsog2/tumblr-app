//
//  AuthViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    //MARK: Properties
    var urlRequest: String?
    var requestToken: String?
    
    //MARK: IBOutlets
    @IBOutlet weak var webView: UIWebView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        
        navigationItem.title = "Tumblr Authentication"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AuthViewController.cancelAuth))
    }
    
    // MARK: Cancel Auth Flow
    func cancelAuth() {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: UIWebViewDelegate extension
extension AuthViewController: UIWebViewDelegate {
    
    //Check for the return
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if webView.request?.url?.absoluteString == "" {
            
        }
    }
}
