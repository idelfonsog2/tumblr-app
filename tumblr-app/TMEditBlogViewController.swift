//
//  TMEditBlogViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit

class TMEditBlogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(TMEditBlogViewController.postTextBlog))
        // Do any additional setup after loading the view.
    }
    
    func postTextBlog() {
        print("testing")
    }


}
