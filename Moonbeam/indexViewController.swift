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

    var numberOfRows = 0
    
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
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        var City = readableJSON["City", "Entry", "city_slug", "value"]
        
        numberOfRows = readableJSON["City"].count
        
        for i in 1...numberOfRows {
            var Entry = "Entry"
            Entry += "\(i)"
            var CitySlug = readableJSON["City"]["Entry1"]["city_slug"].string as String!
            var Value = readableJSON["City"]["Entry1"]["value"].string as String!
            
            citiesArray.append("city_slug")
            valuesArray.append("value")
        }
        
        NSLog("\(City)")
        
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    
        if citiesArray.count != 0 {
            cell.textLabel?.text = citiesArray[indexPath.row]
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

