//
//  ViewController.swift
//  SearchBarWithAlamofire
//
//  Created by admin on 5/16/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet var tableView: UITableView!
    
    var dataArray = NSArray()
    
    var productArray = NSArray()
    var filteredProduct = NSArray()
    
    func loadData() {
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: ["api":"category","category":"all"])
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                self.dataArray = response.result.value as! NSArray
                //self.tableView.reloadData()
                //print(self.dataArray.count)
                //self.productArray = self.dataArray
                //print(self.productArray)
                self.tableView.reloadData()
        }
    }

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return dataArray.count
        //print(dataArray.count)
        //return 10
        
        if (tableView == self.searchDisplayController?.searchResultsTableView) {
            //print(filteredProduct.count)
            return self.filteredProduct.count
        } else {
            //return self.productArray.count
            return self.dataArray.count
        }
        
        //return self.dataArray.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
        //cell0?.textLabel?.text = "AAA"
        //cell0?.detailTextLabel?.text = "BBB"
        //return cell0!
        let item = self.dataArray[indexPath.row] as? NSDictionary
        
        let pn = item?.objectForKey("CategoryName") as? String
        var pa = pn
        self.productArray += item?.objectForKey("CategoryName") as? String
        //var productDataArray = ProductItem()
        if (tableView == self.searchDisplayController?.searchResultsTableView) {
            //productDataArray = self.filteredProduct[indexPath.row] as! NSArray
            //productDataArray = self.filteredProduct[indexPath.row] as? String
            //productDataArray = self.filteredProduct[indexPath.row]
            //print("AA")
            //cell0?.textLabel?.text = item?.objectForKey("CategoryName") as? String
            pa = self.filteredProduct[indexPath.row] as! String
            
        } else {
            //productDataArray = self.dataArray[indexPath.row] as! NSArray
            //print("BB")
            cell0?.textLabel?.text = item?.objectForKey("CategoryName") as? String
            
        }
        
        //cell0?.textLabel?.text = item?.objectForKey("CategoryName") as? String
        //let pn = item?.objectForKey("ProductName") as? String
        //print(pn)
        //cell0?.textLabel?.text = productDataArray
        //cell0?.textLabel?.text = "LL"
        
        return cell0!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

