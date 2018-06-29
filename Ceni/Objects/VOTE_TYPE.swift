//
//  VOTE_TYPE.swift
//  Ceni
//
//  Created by Docta Rhyf on 6/29/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import Foundation

struct VOTE_TYPE {
    
    static let VOTE_TYPE_PREZ : String = "Présidentiel"
    static let VOTE_TYPE_NAT : String = "Législatif National"
    static let VOTE_TYPE_PROV : String = "Législatif Provincial"
    
}

struct VOTE_TYPES {
    static let DATA = [VOTE_TYPE.VOTE_TYPE_PREZ, VOTE_TYPE.VOTE_TYPE_NAT, VOTE_TYPE.VOTE_TYPE_PROV]
}
