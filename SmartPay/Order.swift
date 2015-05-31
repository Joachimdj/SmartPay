//
//  Menu.swift
//  SmartPay
//
//  Created by Joachim Dittman on 27/05/15.
//  Copyright (c) 2015 Joachim Dittman. All rights reserved.
//

import UIKit 
class Order: UITableViewController {
     var data2 = [SQLRow]()
    let db = SQLiteDB.sharedInstance()
    var SelectedItems = [MenuItem]()
    override func viewDidLoad() {
        super.viewDidLoad() 
  
     
      
      data2 = db.query("SELECT itemID, sum(amount) as amount FROM SelectedItems LEFT JOIN MenuItems ON MenuItems.id=SelectedItems.ItemID GROUP BY MenuItems.id")
                         tableView.reloadData()
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
      
      //  return OrderMenuItemDic.count
          return data2.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("OrderItems", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
      // cell.textLabel?.text = "\(OrderMenuItemDic[indexPath.row].name) x \(OrderMenuItemDic[indexPath.row].price).00 DKR"
       let row = data2[indexPath.row]
        if let task = row["ItemID"] {
            
            var price =    row["amount"]
             cell.textLabel?.text = "\(task.asString()) \(price!.asDouble()) "
        }
        if let  task2 = row["price"]{
            var task1 = row["amount"]
            
            cell.detailTextLabel?.text = " \(task1!.asDouble()) DKR"
          final += task2.asDouble() * task1!.asDouble()
            println(final)
        }
 
        return cell
    }
    
    @IBAction func close(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func Tom(sender: AnyObject) {
    OrderMenuItemDic.removeAll(keepCapacity: true)
        tableView.reloadData()
         self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
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
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
}
