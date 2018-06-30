//
//  TableViewControllerFAQ.swift
//  Ceni
//
//  Created by Docta Rhyf on 6/27/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit

class TableViewControllerFAQ: UITableViewController {

    let cellID = "cellFAQ"
    var faqData = [FAQ]()
    let faqFile = "faq.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        faqData = loadFAQData()
    }
    
    func loadFAQData() -> [FAQ] {
        
        var data = [FAQ]()
        
        if let filePath = Bundle.main.path(forResource: "faq", ofType: "txt"){
            do{
                let contents = try String (contentsOfFile: filePath)
                
                var splits = [String]()
                splits = contents.components(separatedBy:  "><")
                
                print(splits)
                
                for i in 0...splits.count{
                    
                    let idxq = i * 2
                    let idxr = idxq+1
                    
                    if(idxr<splits.count){
                        
                        
                        var q:String = splits[idxq] as String
                        q = q.replacingOccurrences(of: "<", with: "");
                        let r = splits[idxr]
                        
                        let faq = FAQ(i:idxq, q:q , r: r)
                        data.insert(faq, at: i)
                    }
                }
            
                
                //print(contents)
            }catch{
                print("Error loading file")
            }
        }else{
            print("file faq.txt not found")
        }
        
        /*
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let fileURL = dir.appendingPathComponent(self.faqFile)
            
            do{
                let fileData = try String(contentsOf: fileURL, encoding: .utf8)
                print(fileData)
            }catch{
                print("error loading data")
            }
        }*/
        
        
        /*
        for index in 0 ... 50{
            
            let faq = FAQ(q: "Question \(index)", r:"Response \(index)")
            data.insert(faq, at: index)
        }*/
        
        return data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return faqData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)

        let view = UIView()
        view.backgroundColor = UIColor.yellow
        cell.selectedBackgroundView = view
        
        cell.textLabel?.text = faqData[indexPath.row].q

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let faq = faqData[(self.tableView.indexPathForSelectedRow?.row)!]
        let destination = segue.destination as! ViewControllerFAQView
        
        destination.faq = faq
    }
 

}
