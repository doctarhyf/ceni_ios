//
//  ViewControllerVoteSimulation.swift
//  Ceni
//
//  Created by Docta Rhyf on 6/29/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit

class ViewControllerVoteSimulation: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellID = "cellSim"
    let simMenu = ["Installation", "Ouvrir les votes", "Passer au vote", "Cloturer les votes",
                   "Parametrage", "Imprimer","Transmettre les resultats"]
    
    let SEG_VOTES = "votes"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simMenu.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = simMenu[indexPath.row]
        
        if(indexPath.row != 2){
            cell.backgroundColor = UIColor.lightGray
            cell.textLabel?.textColor = UIColor.white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 2){
            performSegue(withIdentifier: SEG_VOTES, sender: self)
        }else{
            let alert = UIAlertController(title: Strings.TITLE_DG_OPTION_NOT_AVAIL,
                                          message:Strings.MSG_DG_OPTION_NOT_AVAIL, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
            self.present(alert, animated:true, completion:nil)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let statusBar:UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        AppUtility.lockOrientation(.landscape)
        // Or to rotate and lock
        // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.all)
    }
    
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        /*var rect = CGRect(x:0,y:0,width:self.view.frame.width,
                          height:self.view.frame.height)
        if(UIDevice.current.orientation.isLandscape){
            rect = CGRect(x:0,y:0,width:self.view.frame.height,
                          height:self.view.frame.width)
            
        }*/
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return UIInterfaceOrientation.landscapeLeft
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
