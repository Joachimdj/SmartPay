//
//  Menu.swift
//  SmartPay
//
//  Created by Joachim Dittman on 27/05/15.
//  Copyright (c) 2015 Joachim Dittman. All rights reserved.
//

import UIKit

class Menu: UITableViewController {
    @IBOutlet weak var kurv: UIBarButtonItem!
   // var data1 = [SQLRow]()
    
    //let db = SQLiteDB.sharedInstance()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       sortItemsByCat(Selectedcat)
   
       
  
    }
    
    //SORTING MENUITEMS
    func sortItemsByCat(Selectedcat: Int){
        for MenuItemElement in MenuItemDic {
            if(MenuItemElement.cat == Selectedcat){
                TempMenuItemDic.append(MenuItemElement)
            }
            
        }
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
       return TempMenuItemDic.count
    
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuItem", forIndexPath: indexPath) as! UITableViewCell
        
        
         cell.textLabel?.text = "\(TempMenuItemDic[indexPath.row].name)"
       
        return cell
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      println(indexPath.row)
         println(MenuItemDic.count)
        println(TempMenuItemDic.count)
           var itemId = TempMenuItemDic[indexPath.row].id
        basket += Double(TempMenuItemDic[indexPath.row].price)
        println(itemId)
        var i = 0;
        while (i == 0){
        let sql = "INSERT INTO SelectedItems(id, itemID, amount ) VALUES (1, \(itemId), 1)"
            let rc = db.execute(sql)
            i++
            println("SQL insertet")
        
              kurv.title = "Kurv(\(basket))"
            
        }
      
        
        
    }

}
