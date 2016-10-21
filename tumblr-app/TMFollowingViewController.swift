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
    var blogs: [[String:AnyObject]]?

    //MAR: IBOutlets
    @IBOutlet weak var blogTableView: UITableView!

    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //init OAuth
        self.oauth1swift = TMClient.sharedInstance().oauth1swift as! OAuth1Swift?

        self.showBlogs()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.blogTableView.reloadData()
    }
    
    //MARK: Func

    func showBlogs() {

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


    //MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //FIX:
        return 4
    }


    //Display name of blog in row text
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingViewCell", for: indexPath)

      let blog = self.blogs?[indexPath.row]

      if let name = blog?["name"] as! String? {
          cell.textLabel?.text = name
          print(name)
      }

      return cell
    }

    //Show Details for search results
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let blog = self.blogs?[indexPath.row]

      let controller = storyboard?.instantiateViewController(withIdentifier: "TMUnfollowViewController") as! TMUnfollowViewController

      controller.blog = blog

      self.present(controller, animated: true, completion: nil)

    }
}
