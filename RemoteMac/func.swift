//
//  func.swift
//  Samples
//
//  Created by 博 方 on 16/5/17.
//  Copyright © 2016年 博 方. All rights reserved.
//

import Foundation
import UIKit

func Alert(mes: String) -> UIAlertController {
    let alert = UIAlertController(title: "Alert", message: mes, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alert.addAction(action)
    return alert
}
