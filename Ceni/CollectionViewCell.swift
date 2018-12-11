//
//  CollectionViewCell.swift
//  Ceni
//
//  Created by Docta Rhyf on 12/11/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var candImage: UIImageView!
    @IBOutlet weak var lblCandName: UILabel!
    
    @IBOutlet weak var lblCandNum: UILabel!
    
    @IBOutlet weak var candPrenom: UILabel!
    
    func displayContent(image:UIImage, nom:String, prenom:String, num:String )  {
        
        candImage.image = image
        lblCandName.text = nom
        candPrenom.text = prenom
        lblCandNum.text = num
    }
    
}
