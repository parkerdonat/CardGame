//
//  NetworkController.swift
//  CardGame
//
//  Created by Parker Donat on 4/19/16.
//  Copyright © 2016 Parker Donat. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func dataAtURL(url: String, completion: (data: NSData?) -> Void) {
        guard let url = NSURL(string: url) else {completion(data: nil); return}
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
                
            } else {
                if let data = data {
                    completion(data: data)
                } else {
                    completion(data: nil)
                    print("No data returned from network request")
                }
            }
        }
        
        task.resume()
    }
    
    static func serializedDataAtJson(data: NSData) -> [String: AnyObject]? {
        
        return (try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)) as? [String: AnyObject]
    }
}
