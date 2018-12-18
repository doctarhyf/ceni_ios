//
//  ViewControllerCandidatePopupViewController.swift
//  Ceni
//
//  Created by Docta Rhyf on 12/16/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit

class ViewControllerCandidatePopup: UIViewController {

    
    var candidat : Candidate = Candidate()
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var candNum: UILabel!
    @IBOutlet weak var imgParti: UIImageView!
    @IBOutlet weak var partiName: UILabel!
    @IBOutlet weak var candNomPostnom: UILabel!
    
    @IBOutlet weak var candPrenom: UILabel!
    
   
    
    @IBAction func onSelCandConfirm(_ sender: Any) {
        
        CANDS_SELECTION[CAND_TYPE] = candidat
        if(CAND_TYPE == "prez"){
            CAND_TYPE = "nat"
            CURRENT_ELECTION_PANE = CURRENT_ELECTION_PANE_NAT
        }else if(CAND_TYPE == "nat"){
            CAND_TYPE = "prov"
            CURRENT_ELECTION_PANE = CURRENT_ELECTION_PANE_PROV
        }else if(CAND_TYPE == "prov"){
            CAND_TYPE = "showRes"
            CURRENT_ELECTION_PANE = CURRENT_ELECTION_PANE_PREZ
        }
        
        ACT_SEL_CAND_CONFIRM = true
        
        //print(parent.debugDescription)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onSelCandCanc(_ sender: Any) {
        ACT_SEL_CAND_CONFIRM = false
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        candNum.text = candidat.num
        partiName.text = candidat.partiName
        candNomPostnom.text = candidat.nom
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
