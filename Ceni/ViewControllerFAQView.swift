//
//  ViewControllerFAQView.swift
//  Ceni
//
//  Created by Docta Rhyf on 6/27/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit

class ViewControllerFAQView: UIViewController {

    @IBOutlet weak var labelR: UITextView!
    @IBOutlet weak var labelQ: UITextView!
    var faq:FAQ?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelQ.text = faq?.q
        labelR.text = faq?.r
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
