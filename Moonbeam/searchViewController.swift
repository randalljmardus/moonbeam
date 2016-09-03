//
//  searchViewController.swift
//  Moonbeam
//
//  Created by Randall Mardus on 8/8/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import UIKit

class searchViewController:UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var searchCityLabel: UILabel!
    @IBOutlet weak var searchPicker: UIPickerView!
    
    let pickerData = ["Buffalo", "Portland"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchPicker.dataSource = self
        searchPicker.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        searchCityLabel.text = pickerData[row]
    }
}
