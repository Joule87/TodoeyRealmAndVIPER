//
//  BaseViewController.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/20/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit
import SVProgressHUD
import SwipeCellKit

class BaseViewController: UIViewController {
    
    var viewWillAppear = false
    
    override func viewDidLoad() {
        let color = UIColor(red: 236, green: 240, blue: 241, alpha: 0)
        SVProgressHUD.setBackgroundColor(color)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppear = true
    }
    
    func toggleLoading(isOn: Bool) {
        if isOn {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    //Override at view controllers children in order to update model
    func updateModel(indexPath: IndexPath) {
        
    }
    
    func animateReloadData(for tableView: UITableView) {
        defer { viewWillAppear = false }
        
        if !viewWillAppear {
            tableView.reloadData()
            return
        }
        
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.frame.size.height
        
        cells.forEach{ $0.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)}
        
        var delayCounter: Double = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: delayCounter * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
         
    }
    
}

extension BaseViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { [weak self] action, indexPath in
            if let saveSelf = self {
                saveSelf.updateModel(indexPath: indexPath)
            }
        }
        
        deleteAction.image = UIImage(named: CONSTANTS.ICONS_NAME.DELETE_ICON)
        
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
}
