//
//  ViewControllerSimulation.swift
//  Ceni
//
//  Created by Docta Rhyf on 12/9/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewControllerSimulation: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let CARD_VID_NAME = "card_intro"
    let CARD_VID_TYPE = "mp4"
    var player :AVPlayer?
    var playerLayer:AVPlayerLayer?

    @IBOutlet weak var viewVoteCont: ViewVoteCont!
    @IBOutlet weak var viewElectionPane: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var viewWarning: ViewSimulationWarning!
    
    @IBOutlet weak var titleElectionPane: UILabel!
    @IBOutlet weak var btnInsertCard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //print("view already loaded")
        
        videoView.backgroundColor = UIColor.black
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "candCell", for: indexPath) as! CollectionViewCell
        
        //cell.displayContent(image: UIImage(named: "cd16")!, title: "Candidate")
        let i = indexPath.row + 1
        print(i)
        
        cell.displayContent(image: UIImage(named: "cd\(i)")!, nom: "Nom Postnom \(i)", prenom: "Prenom \(i)", num: "\(i)")
        
        return cell
    }

    @IBAction func insererCarte(_ sender: Any) {
        
        
        
            
            
            
            
            let rect = CGRect(x: self.view.bounds.origin.x,
                              y: self.view.bounds.origin.y,
                              width: self.view.bounds.width ,
                              height: self.view.bounds.height)
            videoView.frame = rect
            playerLayer!.frame = self.videoView.frame
            
            
            player?.play()
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(note:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        
        
            btnInsertCard.isHidden = true
        
    }
    
    @objc func playerDidFinishPlaying(note:NSNotification){
        //self.performSegue(withIdentifier: "menu", sender: self);
        print("player did finish")
        videoView.isHidden = true
        viewElectionPane.isHidden = false
        showElectionsPane(title:"Elections Présidentielles")
    }
    
    func showElectionsPane(title:String){
        print("Showing pane : \(title)")
        
        titleElectionPane.text = title
        
        Timer.scheduledTimer(timeInterval: 1.1,
                             target: self,
                             selector: #selector(self.fireElections(_:)),
                             userInfo: nil,
                             repeats: false)
        
        
        
    }
    
    @objc func  fireElections(_ timer:Timer)  {
        viewElectionPane.isHidden = true
        //print("Elections fired!")
        viewVoteCont.isHidden = false
    }
    
    @IBAction func onSkipWarning(_ sender: Any) {
        
        
        viewWarning.isHidden = true
        videoView.isHidden = false
        loadCardVideo()
    }
    
    func loadCardVideo(){
        
        let videoPath = Bundle.main.path(forResource: CARD_VID_NAME, ofType: CARD_VID_TYPE)
        let videoURL = NSURL.fileURL(withPath: videoPath!)
        
        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        
        
        
        
        self.videoView.layer.addSublayer(playerLayer!)
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
