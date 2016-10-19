//
//  TMBlog.swift
//  tumblr-app
//
//  Created by Idelfonso on 10/19/16.
//  Copyright © 2016 Idelfonso. All rights reserved.
//

import Foundation
import UIKit

//MAR: TMBlog
struct TMBlog {

  //MARK: Properties
  let name: String
  let url: String
  let id: Int

  //MAR: Initializers

  //construct a blog object froma dictionary
  init(dictionary: [String: AnyObject]) {
    self.name = dictionary[ResponseKeys.BlogName] as! String
    self.id   = dictionary[ResponseKeys.BlogID] as! Int
    self.url  = dictionary[ResponseKeys.BlogURL] as! String
  }

  //An array of blogs
  static func blogsFromResults(results: [[String: AnyObject]]) -> [TMBlog] {
    //array to store all entris from json
    var blogs = [TMBlog]()

    //Go through the results
    for result in results {
      blogs.append(TMBlog(dictionary: result))
    }

    return blogs
  }

}
