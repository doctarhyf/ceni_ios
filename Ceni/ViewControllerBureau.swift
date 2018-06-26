//
//  ViewControllerBureau.swift
//  Ceni
//
//  Created by Docta Rhyf on 6/26/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit

class ViewControllerBureau: UIViewController {

    @IBOutlet weak var textFieldNumeroElecteur: UITextField!
    @IBAction func localiserBureau(_ sender: Any) {
        let alert = UIAlertController(title: "Option pas encore disponible",
                                      message:"Cette option sera disponible très prochainement.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:nil))
        self.present(alert, animated:true, completion:nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
