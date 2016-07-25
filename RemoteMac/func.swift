//
//  func.swift
//  Samples
//
//  Created by 博 方 on 16/5/17.
//  Copyright © 2016年 博 方. All rights reserved.
//

import Foundation



let BASE_URL = "remotemac-d5039.firebaseio.com"
//let FIREBASE_REF = Firebase(url: BASE_URL)

//var CURRENT_USER: Firebase {
//    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
//    let currentUser = Firebase(url: "\(FIREBASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
//    return currentUser!
//}
/*
func Alert(mes: String) -> UIAlertController {
    let alert = UIAlertController(title: "Alert", message: mes, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alert.addAction(action)
    return alert
}*/
//********************************User********************************
//func Login(email: String, password: String) -> String {
//    var m = ""
//    FIREBASE_REF.authUser(email, password: password) { (error, authData) in
//        if error == nil {
//            SetUserLogin(authData)
//            m = "Successfully Login"
//        } else {
//            print(error)
//            m = "Failed Login"
//        }
//    }
//    return m
//}

/*

func IfUserLoggedIn() -> Bool {
    print("******Checking User Logged In:********")
    print(NSUserDefaults.standardUserDefaults().valueForKey("uid"))
    if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil {
        print(CURRENT_USER.authData)
    }
    print("***************Data Ends**************")
    return NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && CURRENT_USER.authData != nil
}
func SetUserLogout() {
    CURRENT_USER.unauth()
    NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
    print("Logged out")
}
func SetUserLogin(authData: FAuthData) {
    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
    print("Logged in")
}*/





