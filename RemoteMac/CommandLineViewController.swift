//
//  CommandLineViewController.swift
//  RemoteMac
//
//  Created by 博 方 on 16/7/21.
//  Copyright © 2016年 博 方. All rights reserved.
//

import UIKit
import FirebaseAuth

class CommandLineViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    
    @IBOutlet weak var sendtext: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.text.text = "Loading..."
        
//        FIRApp.configure()
        FIRAuth.auth()?.signInWithEmail("kmfb21@gmail.com", password: "Bloom123", completion: { (user, error) in
            
        })
        
//        self.presentViewController(Alert(Login("kmfb21@gmail.com", password: "Bloom123")), animated: true, completion: nil)
        
/*        let handle = FIREBASE_REF.childByAppendingPath("response").observeEventType(.Value, withBlock: { snapshot in
            self.text.text = ""
            for o in snapshot.value.allObjects {
                //self.text.text.appendContentsOf(o.valueForKey("1")! as! String + " Says: " + (o.valueForKey("2")! as! String) + "\n")
                print(o.valueForKey("1"))
                print(o.valueForKey("2"))
            }
            }, withCancelBlock: { error in
                print(error.description)
        })*/
        //end this observe
        //FIREBASE_REF.removeObserverWithHandle(handle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func send(sender: AnyObject) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
