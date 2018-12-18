//
//  ViewControllerSimulation.swift
//  Ceni
//
//  Created by Docta Rhyf on 12/9/18.
//  Copyright © 2018 KOZI Engineering. All rights reserved.
//
//test github
import UIKit
import MediaPlayer
import AVKit

class ViewControllerSimulation: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let CARD_VID_NAME = "card_intro"
    let CARD_VID_TYPE = "mp4"
    var player :AVPlayer?
    var playerLayer:AVPlayerLayer?
    var candsList : [Candidate] = [Candidate]()
    var selectedCandID : Int = -1
    var currentCand : Candidate? = nil
    let COUNT_CANDS_PREZ : Int = 13
    let COUNT_CANDS_DEP_NAT : Int = 18
    let COUNT_CANDS_DEP_PROV : Int = 18
    

    @IBOutlet weak var viewVoteCont: ViewVoteCont!
    @IBOutlet weak var viewElectionPane: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var viewWarning: ViewSimulationWarning!
    
    @IBOutlet weak var votesTitle: UILabel!
    @IBOutlet weak var titleElectionPane: UILabel!
    @IBOutlet weak var btnInsertCard: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //print("view already loaded")
        
        initAll();
        
        
        
        
    }
    
    func initAll(){
        videoView.backgroundColor = UIColor.black
        
        initCandsData(count:COUNT_CANDS_PREZ)
        
        viewWarning.isHidden = false
        viewVoteCont.isHidden = true
        btnInsertCard.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        /*if(CAND_TYPE == "prez"){
            viewVoteCont.isHidden = false
            initCandsData(count:COUNT_CANDS_PREZ)
            votesTitle.text = CURRENT_ELECTION_PANE
            titleElectionPane.text = CURRENT_ELECTION_PANE
            
            showElectionsPane(title:CURRENT_ELECTION_PANE)
        }*/
        
        
        
        if( (CAND_TYPE == "nat" || CAND_TYPE == "prov") && ACT_SEL_CAND_CONFIRM ){
            initCandsData(count:COUNT_CANDS_DEP_NAT)
            votesTitle.text = CURRENT_ELECTION_PANE
            titleElectionPane.text = CURRENT_ELECTION_PANE
            
            showElectionsPane(title:CURRENT_ELECTION_PANE)
            
        }
        
        if(CAND_TYPE == "showRes"){
            viewVoteCont.isHidden = true
            btnInsertCard.isHidden = true
            //print("showing result")
            CAND_TYPE = "init"
            performSegue(withIdentifier: "showRes", sender: self)
            
        }
        
        if(CAND_TYPE == "init"){
            
            btnInsertCard.isHidden = true
            CAND_TYPE = "prez"
            
            //viewWarning.isHidden = false
            //btnInsertCard.isHidden = false
            
        }
        
        
        
        print("will appear, CAND_TYPE \(CAND_TYPE)")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //viewVoteCont.isHidden = false
        //viewWarning.isHidden = false
        //btnInsertCard.isHidden = false
        
    }
    
    
    
    func initCandsData(count : Int){
        
        let candsCount = count
        
        candsList.removeAll()
        
        for i in 1 ... candsCount{
            var cand : Candidate = Candidate(_nom: "Candidate \(i)", _prenom: "prenom\(i)", _partiName: "parti\(i)", _num:"\(i)")
            
            candsList.append(cand)
        }
        
        collectionView.reloadData()
        //print("cands count \(candsList.count)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return candsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "candCell", for: indexPath) as! CollectionViewCell
        
        //cell.displayContent(image: UIImage(named: "cd16")!, title: "Candidate")
        let i = indexPath.row + 1
        
        
        currentCand = candsList[indexPath.row]
        
        cell.displayContent(image: UIImage(named: "cd\(i)")!, nom: (currentCand?.nom)!, prenom: (currentCand?.prenom)!, num: "\(i)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        //var candID:Int = indexPath.item
        
        self.performSegue(withIdentifier: "presentCandPopup", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "presentCandPopup"){
            let vc : ViewControllerCandidatePopup = segue.destination as! ViewControllerCandidatePopup
            
            vc.candidat = currentCand!
            
        }
    }
    
    @IBAction func insererCarte(_ sender: Any) {
        
        
        
            
            CAND_TYPE = "prez"
            
            
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
        btnInsertCard.isHidden = true
        viewElectionPane.isHidden = false
        showElectionsPane(title:"Elections Présidentielles")
    }
    
    func showElectionsPane(title:String){
        //print("Showing pane : \(title)")
        
        titleElectionPane.text = title
        viewVoteCont.isHidden = true
        viewElectionPane.isHidden = false
        
        
        Timer.scheduledTimer(timeInterval: 2,
                             target: self,
                             selector: #selector(self.fireElections(_:)),
                             userInfo: nil,
                             repeats: false)
        
        
        
        
        
    }
    
    @objc func  fireElections(_ timer:Timer)  {
        viewElectionPane.isHidden = true
        viewVoteCont.isHidden = false
    }
    
    @IBAction func onSkipWarning(_ sender: Any) {
        
        
        viewWarning.isHidden = true
        videoView.isHidden = false
        btnInsertCard.isHidden = false
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
