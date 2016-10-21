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
    var blogs: [TMBlog]?
    var oauth1swift: OAuth1Swift? = nil
    
    //MARK: IBOutlets
    
    @IBOutlet weak var blogTableView: UITableView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //init
        self.blogs = [TMBlog]()
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
        
        //Query params for /users/following
        let parameters = [
            ParameterKeys.ApiKey: ParameterValues.ApiKey
        ]
        
        //GET request
        let _ = oauth1swift?.client.request(TMClient.sharedInstance().tumblrURL(Methods.UsersFollowing), method: .GET, parameters: parameters, headers: nil, success: {
             (data, error) in
            
            let json = TMClient.sharedInstance().convertToJSONObject(data)
            
            if let results = json["response"] as? [[String:AnyObject]] {
                
                print(results)
                
            } else {
                print("no response key found")
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
        return (blogs?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingViewCell", for: indexPath)
        
        let blog = self.blogs?[indexPath.row]
        
        cell.textLabel?.text = "\(blog?.name)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let blog = self.blogs?[indexPath.row]
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "TMDetailBlogViewController") as! TMDetailBlogViewController
        
        controller.blog = blog
        self.present(controller, animated: true, completion: nil)
    }

    

}
