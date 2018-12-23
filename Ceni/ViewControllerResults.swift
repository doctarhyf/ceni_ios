//
//  ViewControllerResults.swift
//  Ceni
//
//  Created by Docta Rhyf on 12/17/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit

class ViewControllerResults: UIViewController {
    
    
    @IBOutlet weak var cpNum: UILabel!
    @IBOutlet weak var cpImgParti: UIImageView!
    @IBOutlet weak var cpImg: UIImageView!
    @IBOutlet weak var cpParti: UILabel!
    @IBOutlet weak var cpNomPostnom: UILabel!
    @IBOutlet weak var cpPrenom: UILabel!
    
    @IBOutlet weak var cdnNum: UILabel!
    @IBOutlet weak var cdnImgParti: UIImageView!
    @IBOutlet weak var cdnImg: UIImageView!
    @IBOutlet weak var cdnParti: UILabel!
    @IBOutlet weak var cdnNomPostnom: UILabel!
    @IBOutlet weak var cdnPrenom: UILabel!
    
    @IBOutlet weak var cdpNum: UILabel!
    @IBOutlet weak var cdpImgParti: UIImageView!
    @IBOutlet weak var cdpImg: UIImageView!
    @IBOutlet weak var cdpParti: UILabel!
    @IBOutlet weak var cdpNomPostnom: UILabel!
    @IBOutlet weak var cdpPrenom: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let cp : Candidate = CANDS_SELECTION["prez"]!
        cpNum.text = cp.num
        //parti
        cpImg.image = cp.img
        cpParti.text = cp.partiName
        cpNomPostnom.text = cp.nom
        cpPrenom.text = cp.prenom
        cpImg.image = cp.img
        cpImgParti.image = cp.imgParti
        
        let cdn : Candidate = CANDS_SELECTION["nat"]!
        cdnNum.text = cdn.num
        //parti
        cdnImg.image = cdn.img
        cdnParti.text = cdn.partiName
        cdnNomPostnom.text = cdn.nom
        cdnPrenom.text = cdn.prenom
        cdnImg.image = cdn.img
        cdnImgParti.image = cdn.imgParti
        
        let cdp : Candidate = CANDS_SELECTION["prov"]!
        cdpNum.text = cdp.num
        //parti
        cdpImg.image = cdp.img
        cdpParti.text = cdp.partiName
        cdpNomPostnom.text = cdp.nom
        cdpPrenom.text = cdp.prenom
        cdpImg.image = cdp.img
        cdpImgParti.image = cdp.imgParti
        
    }

    
    @IBAction func shareImage(_ sender: Any) {
        
        let image = self.takeScreenShot(false)
        
        let imageToShare = [image]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        //activityViewController.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.postToFacebook]
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    open func takeScreenShot(_ shouldSave :Bool = true) -> UIImage?{
    
        var screenShotImage : UIImage?
        let layer = mainView.layer//UIApplication.shared.keyWindow!.layer;
        let scale = layer.contentsScale// UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if let image = screenShotImage, shouldSave{
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        
    
    
        return screenShotImage
    
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
