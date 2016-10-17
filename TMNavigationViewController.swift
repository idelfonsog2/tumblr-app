//
//  TMNavigationViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit

class TMNavigationViewController: UIViewController  {
    
    //MARK: Properties
    
    //MARK: IBOutlets
    @IBAction func dismissButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MAR: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
