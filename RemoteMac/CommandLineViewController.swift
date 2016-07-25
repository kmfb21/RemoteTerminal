//
//  CommandLineViewController.swift
//  RemoteMac
//
//  Created by 博 方 on 16/7/21.
//  Copyright © 2016年 博 方. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class CommandLineViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var sendtext: UITextField!
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        self.text.text = "Loading..."
        FIRAuth.auth()?.signInWithEmail("kmfb21@gmail.com", password: "Bloom123", completion: { (user, error) in
            if error != nil {
                self.presentViewController(Alert("Connection Failed"), animated: true, completion: nil)
            }
        })
        self.text.text = ""
        
        //Trying colorful text in TextView
        //var s = NSAttributedString.init(string: "a", attributes: [NSForegroundColorAttributeName: UIColor.blueColor()])
        
        _ = ref.child("response").observeEventType(.Value, withBlock: { snapshot in
            self.text.text.appendContentsOf(snapshot.value![1] as! String)
            self.sendtext.text = snapshot.value![2] as? String

            }, withCancelBlock: { error in
                print(error.description)
        })
        
        //end this observe
        //ref.child("response").removeObserverWithHandle(handle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func send(sender: AnyObject) {
        
        ref.child("command").setValue(self.sendtext.text)
        ref.child("done").setValue(0)
    }

}
