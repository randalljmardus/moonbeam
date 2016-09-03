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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        parseJSON()
    }
    
    func parseJSON() {
        let path : String = NSBundle.mainBundle().pathForResource("jsonFile", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        let city_slug = readableJSON["City", "Buffalo", "city_slug"]
        NSLog("\(city_slug)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

