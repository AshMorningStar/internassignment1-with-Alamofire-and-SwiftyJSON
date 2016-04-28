//
//  MyTableVC.swift
//  internassignment1
//
//  Created by Mohamad Asyraaf on 27/4/16.
//  Copyright © 2016 Mohamad Asyraaf bin Abdul Rahman. All rights reserved.
//

import UIKit


class MyTableVC: UITableViewController{
    
    var namesStorage: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parkingLotInfoURL = "http://api.mapsynq.com/api/1.0/feeds/pds.json"
        let nsUrlForParkingLot = NSURL(string: parkingLotInfoURL)!
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithURL(nsUrlForParkingLot) { (data :NSData?, response: NSURLResponse?, error: NSError?) in
            
            if let reponseData = data{
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(reponseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    if let dictJson = json as? Dictionary<String,AnyObject>{
                        
                        if let data = dictJson["data"] as? [Dictionary<String,AnyObject>] {
                            
                            
                            for names in data {
                                let name = names["name"] as! String
                                
                                
                                print(name)
                                
                                self.namesStorage.append(name)
                                
                                
                                
                                
                            }
                            
                            print(self.namesStorage[1])
                            self.tableView.reloadData()
                            
                            
                            
                        }
                        
                        
                        
                    }
                    
                    //print(json)
                    
                    
                }catch{
                    
                    print("Serialization Failed")
                }
                
                
                
                
                
                
                
                
                
            }
            }.resume()
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) { //when an item is selected from the table view
        
        let selectedParkingName = namesStorage[indexPath.row]
        
        //*Note: There is a new SFSafariViewController to rpelace wkWebView:Just import SafariServices to use it
        
        print("User has selected \(selectedParkingName)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return namesStorage.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("theCell", forIndexPath: indexPath)

    
    
        
        if let label = cell.textLabel{
            label.text = namesStorage[indexPath.row]
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
