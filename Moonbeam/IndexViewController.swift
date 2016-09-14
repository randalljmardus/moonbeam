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
    
    var citiesArray = [String]()
    var valuesArray = [String]()
    
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
            print(json)
            }
    
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
//       var city = readableJSON["city"]["city_slug"]["value"]
//        I think the problem is that my json file has an array in it and that the video does not so when it comes time to call I'm not set up to call from an array. How do I call from an array in a json file? Go back to the SwiftyJSON documentation and see how they did it.
        
        var cityArray = readableJSON["city"]
        for i in 0...cityArray.count-1 {
//            var city = "city"
//            city += "\(i)"
//            
//            let citySlug = readableJSON["city"][0]["city_slug"].string as String!
//            let value = readableJSON[0]["value"].string as String!
//        
//            citiesArray.append(citySlug)
//            valuesArray.append(value)
            //when I append ("city_slug") it prints "city_slug" to the app, but when I try to pass citySlug or value constants it crashes and says it is nil which means lines 46/47 are not pulling from the json file the way that line 32 does.
            print(cityArray[i]["city_slug"])

        }
        
  //      NSLog("\(city)")
                
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        if citiesArray.count != 0 {
            cell.textLabel?.text = citiesArray[indexPath.row] + " " + valuesArray[indexPath.row]
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

