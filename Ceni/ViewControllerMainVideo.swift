//
//  ViewControllerMainVideo.swift
//  Ceni
//
//  Created by Docta Rhyf on 6/27/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewControllerMainVideo: UIViewController {

    //var moviePlayer:AVPlayer?
    let INTRO_VID_NAME = "ceni_intro_vid"
    let INTRO_VID_TYPE = "mp4"
    var player :AVPlayer?
    var playerLayer:AVPlayerLayer?
    
    
    
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.black
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        let videoPath = Bundle.main.path(forResource: INTRO_VID_NAME, ofType: INTRO_VID_TYPE)
        let videoURL = NSURL.fileURL(withPath: videoPath!)
        
        videoView.backgroundColor = UIColor.black
        
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        
        
        self.videoView.layer.addSublayer(playerLayer!)
        
        
        
        
        
        //playVideo()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        let statusBar:UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let statusBar:UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        statusBar.isHidden = false
    }
    
    func playVideo(){
        
        
        
        
        let rect = CGRect(x: self.view.bounds.origin.x,
                          y: self.view.bounds.origin.y,
                          width: self.view.bounds.width ,
                          height: self.view.bounds.height)
        videoView.frame = rect
        playerLayer!.frame = self.videoView.frame
        
        
        player?.play()
        
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.landscape
    }
    
    
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        return UIInterfaceOrientation.portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        var f = videoView.frame
        playVideo()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        var rect = CGRect(x:0,y:0,width:self.view.frame.width,
                          height:self.view.frame.height)
        if(UIDevice.current.orientation.isLandscape){
            rect = CGRect(x:0,y:0,width:self.view.frame.height,
                              height:self.view.frame.width)
            
        }
        videoView.frame = rect
        playerLayer?.frame = rect
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        player?.pause()
        player?.seek(to: CMTimeMakeWithSeconds(0, 1))
        
        
        
    }
 

}
