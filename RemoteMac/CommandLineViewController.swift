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

var _text: UnsafePointer<Void> = nil

class CommandLineViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var sendtext: UITextField!
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _text = unsafeAddressOf(self.text.text)
        
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
            self.text.text.appendContentsOf((snapshot.value! as! NSArray)[1] as! String)
            let tmpstr = (snapshot.value! as! NSArray)[2] as? String
            if tmpstr != "" {
                self.sendtext.text = tmpstr
            }
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        //end this observe
        //ref.child("response").removeObserverWithHandle(handle)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CommandLineViewController.keyboardWillAppear(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CommandLineViewController.keyboardWillDisappear(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillAppear(notification: NSNotification) {
        
        self.sendtext.text = ""
        
        let keyboardRect: CGRect = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue())!
        let keyboardHeight:CGFloat = keyboardRect.height
        setViewMovedUp(keyboardHeight)
    }
    func keyboardWillDisappear(notification: NSNotification) {
        let keyboardRect: CGRect = (notification.userInfo![UIKeyboardFrameEndUserInfoKey]?.CGRectValue())!
        let keyboardHeight:CGFloat = keyboardRect.height
        setViewMovedUp(-keyboardHeight)
    }
    func setViewMovedUp(movedUp: CGFloat) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        
        var rect = self.view.frame
        rect.size.height -= movedUp
        self.view.frame = rect
        UIView.commitAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func send(sender: AnyObject) {
        ref.child("command").setValue(self.sendtext.text)
        ref.child("done").setValue(0)
        sendtext.resignFirstResponder()
        self.text.text.appendContentsOf("bofang@MyMacBook $ \(self.sendtext.text!)\n")
    }

}
