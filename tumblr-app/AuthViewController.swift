//
//  AuthViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/15/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    var urlRequest: String?
    var requestToken: String?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        
        navigationItem.title = "Tumblr Authentication"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AuthViewController.cancelAuth))
    }
    
    func cancelAuth() {
        dismiss(animated: true, completion: nil)
    }
}

extension AuthViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if webView.request?.url?.absoluteString == "" {
            
        }
    }
}
