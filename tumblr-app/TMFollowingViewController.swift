//
//  TMFollowingViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMFollowingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Properties
    var oauth1swift: OAuth1Swift? = nil
    var blogs: [[String:AnyObject]]?
    
    //MARK: IBOutlets
    
    @IBOutlet weak var blogTableView: UITableView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
        
        //Query params for /users/following
        let parameters = [
            ParameterKeys.ApiKey: ParameterValues.ApiKey
        ]
        
        //GET request
        let _ = oauth1swift?.client.request(TMClient.sharedInstance().tumblrURL(Methods.UsersFollowing), method: .GET, parameters: parameters, headers: nil, success: {
             (data, error) in
            
            let json = TMClient.sharedInstance().convertToJSONObject(data)
            
            guard let results = json["response"] as? [String:AnyObject] else {
                print("No response key found")
                return
            }
            
            guard let blogsDictionaryArray = results["blogs"] as? [[String:AnyObject]] else {
                print("No 'blogs' key found")
                return
            }
            
            self.blogs = blogsDictionaryArray
            
            DispatchQueue.main.async {
                self.blogTableView.reloadData()
            }
            
            }, failure: {
                (error) in
                print(error)
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingViewCell", for: indexPath)
        
        let blog = self.blogs?[indexPath.row]

        if let name = blog?["name"] as! String? {
            cell.textLabel?.text = name
            print(name)
        }
    
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let blog = self.blogs?[indexPath.row]
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "TMDetailBlogViewController") as! TMDetailBlogViewController
        
        //controller.blog = blog
        
        self.present(controller, animated: true, completion: nil)
    }

    

}
