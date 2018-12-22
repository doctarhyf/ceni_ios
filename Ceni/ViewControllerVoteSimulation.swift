//
//  ViewControllerVoteSimulation.swift
//  Ceni
//
//  Created by Docta Rhyf on 6/29/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit

class ViewControllerVoteSimulation: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var labelCountDown: UILabel!
    let cellID = "cellSim"
    let simMenu = ["Installation", "Ouvrir les votes", "Passer au vote", "Cloturer les votes",
                   "Parametrage", "Imprimer","Transmettre les resultats"]
    
    let SEG_VOTES = "votes"
    var counter = 30
    var dueDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let calendar = Calendar.current
        var dateComponents : DateComponents? = calendar.dateComponents([.hour, .minute, .second], from: Date())
        
        dateComponents?.day = 30
        dateComponents?.month = 12
        dateComponents?.year = 2018
        
        dueDate = calendar.date(from: dateComponents!)
        //print("The date : \(date!)");
        
        //counter = dueDate?.timeIntervalSince1970.
        
        
        var _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter(){
        
        /*
        var s = counter
        
        var difftime = dueDate?.timeIntervalSinceNow
        
        print("due date : \(dueDate)")
        print("date diff : \(difftime)")
        
        var diff : Int = Int(difftime!)
        
        var secsInMilli = 1000;
        var minInMilli = secsInMilli * 1000
        var hinMilli = minInMilli * 1000
        var dinMill = hinMilli * 1000
        
        var diffDays = diff / dinMill;
        diff = diff % dinMill
        
        print("diff : \(diff) , dinMill : \(dinMill), diff/dinMill \(Double(diff)/Double(dinMill))")
        
        var diffHours = diff / hinMilli;
        diff = diff % hinMilli
        
        var diffMins = diff / minInMilli;
        diff = diff % minInMilli
        
        var diffSecs = diff / secsInMilli;
        */
        
        let nowDate = Date()
        let cal = Calendar.current
        
        let d = cal.component(.day, from:nowDate)
        let diffDays = 30 - d
        
        if(counter > 0 ){
            print("\(counter) seconds to the end of the world");
            counter -= 1
            labelCountDown.text = "J - \(diffDays) "
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simMenu.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = simMenu[indexPath.row]
        let view = UIView()
        if(indexPath.row != 2){
            cell.backgroundColor = CENI_COLORS.CD_LIGHT_GRAY
            cell.textLabel?.textColor = UIColor.white
            view.backgroundColor = CENI_COLORS.CD_LIGHT_GRAY
            
        }else{
            
            view.backgroundColor = CENI_COLORS.CD_BLUE
            
        }
        cell.selectedBackgroundView = view
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 2){
            performSegue(withIdentifier: SEG_VOTES, sender: self)
            //let alert = UIAlertController(title: Strings.TITLE_DG_COMING_SOON,
              //                            message:Strings.MSG_DG_COMING_SOON, preferredStyle: UIAlertControllerStyle.alert)
            //alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
            //self.present(alert, animated:true, completion:nil)
            //println("This is a test")
            //print("test")
        }else{
            let alert = UIAlertController(title: Strings.TITLE_DG_OPTION_NOT_AVAIL,
                                          message:Strings.MSG_DG_OPTION_NOT_AVAIL, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
            self.present(alert, animated:true, completion:nil)
        }
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
