//
//  ViewController.swift
//  internassignment1
//
//  Created by Mohamad Asyraaf on 27/4/16.
//  Copyright © 2016 Mohamad Asyraaf bin Abdul Rahman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var tableView:UITableView!
    
    var namesStorage: [String] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let parkingLotInfoURL = "http://api.mapsynq.com/api/1.0/feeds/pds.json"
        
        Alamofire.request(.GET, parkingLotInfoURL).responseJSON { (reponse) in //web request to get jso n data
            if let response = reponse.data{
                
                let json = JSON(data:response) //using swiftyjson,converts the data from the web to a JSON Object.
                
                let data = json["data"].arrayValue //retrieves the "data" from json
                
                for names in data{  //for each "name" form the data arrray,store it in a String array,called namesStorage
                    let name = names["name"].stringValue
                    
                    print(name)
                    self.namesStorage.append(name)
                    
                }
                
                self.tableView.reloadData()
            }
            
            

                
            }
    
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesStorage.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        
        
        
        if let label = cell.textLabel{
            label.text = namesStorage[indexPath.row]
        }
        
        return cell
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedParkingName = namesStorage[indexPath.row]
          print("User has selected \(selectedParkingName)")

    }


}

