//
//  ViewController.swift
//  Moonbeam
//
//  Created by Randall Mardus on 8/8/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit
import SwiftyJSON

class indexViewController: UITableViewController {
    
    let numberOfRows = 1
    
    var cityArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        parseJSON()
    }
    
    func parseJSON() {
        
        let path : String = NSBundle.mainBundle().pathForResource("buffalo", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        //when you can pull from the VA url, change contentsOfFile: path to contentsOfFile: insertVAURLhere)
        
        if let json = try? NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions()) as? [String:AnyObject]
            {
            }
        
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        var cityArray = readableJSON["city"]
        
        print(cityArray[0]["city_slug"])
        print(cityArray[0]["value"])
    
          //  print(cityArray[0]["city_slug"])
          //  print(cityArray[0]["value"])
//          this prints values to the console. How do I return values to the app? Presumably by calling the function. 
}

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        
        if cityArray.count != 0 {
        cell.textLabel?.text = cityArray[indexPath.row]
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

