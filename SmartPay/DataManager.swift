//
//  DataManager.swift
//  SmartPay
//
//  Created by Joachim Dittman on 27/05/15.
//  Copyright (c) 2015 Joachim Dittman. All rights reserved.
//

import UIKit 

// PUBLIC DATA DICTONARYS
var CatDic = [Cat]()
var MenuItemDic = [MenuItem]()
var TempMenuItemDic = [MenuItem]()
var OrderReciptDic = [Recipt]()
var OrderMenuItemDic = [MenuItem]()
var ReciptDic = [Recipt]()
var UserDic = [User]()
var paymentCardDic = [PaymentCard]()
var Selectedcat = 1
var final = 0.0
var basket = 0.0
 let db = SQLiteDB.sharedInstance()
 

   func loadCatData(){
      let sqlDelete = "DELETE FROM Categories"
      db.execute(sqlDelete)
    let sqlDelete1 = "Delete FROM SelectedItems"
      db.execute(sqlDelete1)
    
    
    CatDic.append(Cat(id:1,name:"Drikkevarer",storeId:1))
    CatDic.append(Cat(id:2,name:"Mad",storeId:1))
    CatDic.append(Cat(id:3,name:"Snaks",storeId:1))
    CatDic.append(Cat(id:4,name:"Øvrige",storeId:1))
    
    for cat in CatDic{
        let sql = "INSERT INTO categories(id, name, storeId) VALUES (\(cat.id),'\(cat.name)', \(cat.storeId))"
        let rc = db.execute(sql)
    }
    
}

   func loadMenuItemData(){
    
   let sqlDelete = "Delete FROM MenuItems"
    db.execute(sqlDelete)
    
    //let sql = "CREATE TABLE MenuItems(id INTEGER PRIMARY KEY ASC, name, desc, price NUMBER, currentAmount NUMBER, cat INTEGER , storeId INTEGER)"
   //  db.execute(sql)

    
    for(var i = 0; i<2;  i++){
        var randomNumber = Int(arc4random_uniform(1000000000))
    MenuItemDic.append(MenuItem(id:randomNumber,name:"Øl (Tuborg)", desc : "Something about", price: 20, currentAmount: 200, cat: 1, storeId:1 ))
      randomNumber = Int(arc4random_uniform(1000000000))
    
    MenuItemDic.append(MenuItem(id:randomNumber,name:"Toast", desc : "Something about", price: 20, currentAmount: 100, cat: 2, storeId:1 ))
       randomNumber = Int(arc4random_uniform(1000000000))
        
    MenuItemDic.append(MenuItem(id:randomNumber,name:"Fritter", desc : "Something about", price: 30, currentAmount: 100, cat: 3, storeId:1 ))
      randomNumber = Int(arc4random_uniform(1000000000))
        
    MenuItemDic.append(MenuItem(id:  randomNumber,name:"Popkorn", desc : "Something about", price: 15, currentAmount: 400, cat: 4, storeId:1 ))
       
      for menuItem in MenuItemDic{
            let sql = "INSERT INTO MenuItems(id, name, desc, price, currentAmount, cat, storeId) VALUES (\(menuItem.id),'\(menuItem.name)','\(menuItem.desc)', '\(menuItem.price)', '\(menuItem.currentAmount)','\(menuItem.cat)', \(menuItem.storeId))"
            let rc = db.execute(sql)
        }
    }
    
       
     }

    
    
    
 
    