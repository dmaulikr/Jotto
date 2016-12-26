//
//  GameScreenViewController.swift
//  Jotto
//
//  Created by Ashwin Vivek on 12/26/16.
//  Copyright © 2016 AshwinVivek. All rights reserved.
//

import UIKit
import FirebaseDatabase

class OnlineGameViewController: UIViewController {
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loadingPlayers: UIActivityIndicatorView!

    var playingOnlineRef: FIRDatabaseReference = FIRDatabase.database().reference().child("Playing Online")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.loadingPlayers.startAnimating()
        self.loadingLabel.isHidden = false
        
        playingOnlineRef.observe(.childAdded, with: {(snapshot) in
            
            let key = snapshot.key
            let user = userObject(snapshot: snapshot)
            
            if (!user.hasBeenChosen()){
                self.loadingPlayers.stopAnimating()
                self.loadingLabel.isHidden = true
                let wordToGuess = user.word
                self.playingOnlineRef.child(keys).child("wordToGuess").setValue(wordToGuess)
                self.playingOnlineRef.child(key).child("wordToGuess").setValue(myWord)
                self.performSegue(withIdentifier: "toRandomGame", sender: Any?.self)
            }
            
        })
        
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