//
//  UITableViewControllerMainMenuTableViewController.swift
//  Ceni
//
//  Created by Docta Rhyf on 6/26/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit



class UITableViewControllerMainMenuTableViewController: UITableViewController {

    var mainMenuArray = [MenuItem]()
    let SEG_ID_VOTESIM = "voteSim"
    let SEG_ID_CANDS = "cands"
    let SEG_ID_BUREAU = "bureau"
    let SEG_ID_LIST_CAND = "listCand"
    let SEG_ID_RES_OFF = "resOff"
    let SEG_ID_FAQ = "faq"
    let SEG_ID_CONTACT = "contact"
    let SEG_ID_NEWS = "news"
    
    var mainMenuImagesNames = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        var menuItem = MenuItem(title:"Simuler un vote", subtitle:"Comment utiliser la machine a voter?")
        mainMenuArray.append(menuItem)
        mainMenuImagesNames.insert("sim", at: 0)
        
        
        menuItem = MenuItem(title:"Candidats", subtitle:"Suis-je inscrit sur la liste des candidats?")
        mainMenuArray.append(menuItem)
        mainMenuImagesNames.insert("sim", at: 1)
        
        menuItem = MenuItem(title:"Mon bureau de vote", subtitle:"Où se trouve mon bureau de vote?")
        mainMenuArray.append(menuItem)
        mainMenuImagesNames.insert("bv", at: 2)
        
        
        menuItem = MenuItem(title:"Liste des candidats", subtitle:"Candidats inscrits aux scrutins")
        mainMenuArray.append(menuItem)
        mainMenuImagesNames.insert("cands", at: 3)
        
        menuItem = MenuItem(title:"Résultats officiels", subtitle:"Résultats officiels des scrutins")
        mainMenuArray.append(menuItem)
        mainMenuImagesNames.insert("res", at: 4)
        
        menuItem = MenuItem(title:"Foire aux questions", subtitle:"Questions fréquentes sur les élections")
        mainMenuArray.append(menuItem)
        mainMenuImagesNames.insert("ic_faq", at: 5)
        
        menuItem = MenuItem(title:"News", subtitle:"Informations officielles de la CENI")
        mainMenuArray.append(menuItem)
        mainMenuImagesNames.insert("ic_news", at: 6)
        
        menuItem = MenuItem(title:"Contactez-nous", subtitle:"N'hésitez pas a nous contacter")
        mainMenuArray.append(menuItem)
        mainMenuImagesNames.insert("ic_contacts", at: 7)
        
        
        
        
    }
    
    override var shouldAutorotate: Bool{
        return true
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
        return mainMenuArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = mainMenuArray[indexPath.row].title
        cell.detailTextLabel?.text = mainMenuArray[indexPath.row].subtitle
        cell.imageView?.image = UIImage(named:mainMenuImagesNames[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: SEG_ID_VOTESIM, sender: self)
            break
            
        case 1:
            self.performSegue(withIdentifier: SEG_ID_CANDS, sender: self)
            break
            
        case 2:
            self.performSegue(withIdentifier: SEG_ID_BUREAU, sender: self)
            break
            
        case 6:
            self.performSegue(withIdentifier: SEG_ID_NEWS, sender: self)
            break
            
        case 7:
            self.performSegue(withIdentifier: SEG_ID_CONTACT, sender: self)
            break
            
        default:
            print("default")
        }
        
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
