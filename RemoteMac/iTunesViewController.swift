//
//  iTunesViewController.swift
//  RemoteMac
//
//  Created by 博 方 on 16/7/21.
//  Copyright © 2016年 博 方. All rights reserved.
//

import UIKit
import Firebase

class iTunesViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    
    @IBOutlet weak var sendtext: UILabel!
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = FIRDatabase.database().reference()
        _ = ref.child("response").observeEventType(.Value, withBlock: { snapshot in
            self.text.text = (snapshot.value! as! NSArray)[1] as! String
            self.sendtext.text?.appendContentsOf((snapshot.value! as! NSArray)[2] as! String)
            }, withCancelBlock: { error in
                print(error.description)
        })
        
    }
    
    @IBAction func volUp(sender: AnyObject) {
        send("~/itunes vol up")
    }
    @IBAction func volDown(sender: AnyObject) {
        send("~/itunes vol down")
    }
    @IBAction func prev(sender: AnyObject) {
        send("~/itunes prev && ~/itunes status")
    }
    @IBAction func next(sender: AnyObject) {
        send("~/itunes next && ~/itunes status")
    }
    @IBAction func help(sender: AnyObject) {
        send("~/itunes")
    }
    @IBAction func quit(sender: AnyObject) {
        send("~/itunes quit")
    }
    
    @IBOutlet weak var play: UIButton!
    @IBAction func playstop(sender: AnyObject) {
        send("~/itunes play && ~/itunes status")
        ref.child("response").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            let s = (snapshot.value! as! NSArray)[1] as! String
            let compare = "Playing iTunes.\niTunes is currently playing."
            print(s.substringToIndex(s.startIndex.advancedBy(min(compare.characters.count, s.characters.count))))
            if s.substringToIndex(s.startIndex.advancedBy(min(compare.characters.count, s.characters.count))) != compare {
                self.send("~/itunes play && ~/itunes status")
                self.play.setTitle("||", forState: UIControlState.Normal)
            } else {
                self.send("~/itunes pause")
                self.play.setTitle("|>", forState: UIControlState.Normal)
            }
        })
    }
    
    func send(command: String) {
        self.sendtext.text = command
        ref.child("command").setValue(command)
        ref.child("done").setValue(0)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.send("~/itunes status")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
