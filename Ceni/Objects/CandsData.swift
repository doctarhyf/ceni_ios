//
//  CandsData.swift
//  Ceni
//
//  Created by Docta Rhyf on 12/16/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import Foundation


var CANDS_SELECTION =  [String:Candidate]()
var CAND_TYPE : String = "prez"
let CURRENT_ELECTION_PANE_PREZ : String = "Eléctions Presidentielles"
let CURRENT_ELECTION_PANE_NAT : String = "Législatives Nationales"
let CURRENT_ELECTION_PANE_PROV : String = "Législatives Provinciales"
var CURRENT_ELECTION_PANE : String = CURRENT_ELECTION_PANE_PREZ
var ACT_SEL_CAND_CONFIRM : Bool = false;


struct Candidate{
    
    var nom : String = ""
    var prenom : String = ""
    var partiName : String = ""
    var num : String = ""
    
    init(_nom:String,_prenom:String,_partiName:String,_num:String) {
        
        nom = _nom;
        prenom = _prenom;
        partiName = _partiName;
        num = _num
    }
    
    init(){
        
    }
    
}
