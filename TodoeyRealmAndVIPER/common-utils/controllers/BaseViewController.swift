//
//  BaseViewController.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/20/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        let color = UIColor(red: 236, green: 240, blue: 241, alpha: 0)
        SVProgressHUD.setBackgroundColor(color)
    }
    
    func toggleLoading(isOn: Bool) {
        if isOn {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
}
