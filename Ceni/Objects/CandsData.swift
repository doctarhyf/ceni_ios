//
//  CandsData.swift
//  Ceni
//
//  Created by Docta Rhyf on 12/16/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import Foundation
import UIKit


var CANDS_SELECTION =  [String:Candidate]()
var CAND_TYPE : String = "prez"
let CURRENT_ELECTION_PANE_PREZ : String = "Eléctions Presidentielles"
let CURRENT_ELECTION_PANE_NAT : String = "Législatives Nationales"
let CURRENT_ELECTION_PANE_PROV : String = "Législatives Provinciales"
var CURRENT_ELECTION_PANE : String = CURRENT_ELECTION_PANE_PREZ
var ACT_SEL_CAND_CONFIRM : Bool = false;
let PARTIES : [Int:String] = [1:"eps", 2:"independant",3:"kozi",4:"lion",5:"loboko",6:"losambo",7:"masomo",8:"mosala",9:"ndule",10:"vision",11:"xdb"]


struct Candidate{
    
    var nom : String = ""
    var prenom : String = ""
    var partiName : String = ""
    var num : String = ""
    var img : UIImage? = UIImage()
    var imgParti : UIImage? = UIImage()
    
    init(_img:UIImage, _imgParti:UIImage, _nom:String,_prenom:String,_partiName:String,_num:String) {
        
        nom = _nom;
        prenom = _prenom;
        partiName = _partiName;
        num = _num
        img = _img
        imgParti = _imgParti
    }
    
    init(){
        
    }
    
}
