//
//  TMDetailBlogViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/19/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit

class TMDetailBlogViewController: UIViewController {
    
    //MARK: Properties
    var blog: TMBlog?

    //MARK: IBOutlets
    
    @IBOutlet weak var blogNameLabel: UILabel!
    @IBOutlet weak var unfollowButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
