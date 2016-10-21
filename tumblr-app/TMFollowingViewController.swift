//
//  TMFollowingViewController.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/17/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import UIKit
import OAuthSwift

class TMFollowingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: Properties
    var oauth1swift: OAuth1Swift? = nil
    var blogs: [TMBlog]?
    var session = TMClient.sharedInstance()
    var blogName: String?
    
    //MAR: IBOutlets
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.blogs = [TMBlog]()
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?
        self.showBlogs()
    }
    
    //MARK: Func
    
    func showBlogs() {
        
        //Query param for /user/following
        let parameters = [
            ParameterKeys.ApiKey: ParameterKeys.ApiKey
        ]
        
        //GET request
        let _ = oauth1swift?.client.request(session.tumblrURL(Methods.UsersFollowing), method: .GET, parameters: parameters, headers: nil, success: {
             (data, error) in
            
                let json = TMClient.sharedInstance().convertToJSONObject(data)
                print(json)
                if let results = json["response"] as? [[String:AnyObject]] {
                    self.blogs = TMBlog.blogsFromResults(results: results)
                    for blog in self.blogs! {
                        //self.blogName = blog["name"] as! String
                    }
                
                }
            
            }, failure: {
                (error) in
                print("Error in GET Call request to \(Methods.UsersFollowing)")
                print(error.localizedDescription)
        })
        
    }
    
    
    //MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.blogs?.count)!
    }
    
    
    //Display name of blog in row text
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchViewCell", for: indexPath) as UITableViewCell!
        
        if let blog = self.blogs?[indexPath.row] {
            if let name = blog.name {
                cell?.textLabel?.text = "\(name)"
            }
        }
        
        return cell!
    }
    
    //Show Details for search results
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let blog = self.blogs?[indexPath.row]
//        
//        let controller = storyboard!.instantiateViewController(withIdentifier: "TMDetailFollowingViewController") as! TMDetailFollowingViewController
//        
//        controller.blog = blog!
//        
//        self.present(controller, animated: true, completion: nil)
        
    }
}
