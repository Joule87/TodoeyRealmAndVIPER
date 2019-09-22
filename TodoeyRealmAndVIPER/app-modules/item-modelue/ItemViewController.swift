//
//  ItemViewController.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/21/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit

class ItemViewController: BaseViewController {
    
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    static let viewControllerIdentifier = "ItemViewController"
    private let ITEM_SCREEN_TITLE = "Items"
    var presenter: ItemViewPresenterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.notifyViewWillAppear()
    }
    
    @objc func addItem() {
      var textField = UITextField()
          let alertController = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
          alertController.addTextField { (alertTextField) in
              alertTextField.placeholder = "Add an Item"
              textField = alertTextField
          }
          let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] alertAction in
              if let itemTitle = textField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines), itemTitle.count > 0 {
                  self?.presenter?.addNewItem(name: itemTitle, done: false)
              }
          }
          let cancelAction = UIAlertAction(title: "Cancel", style: .default) { [weak self] alertAction in
              self?.dismiss(animated: true)
          }
          alertController.addAction(addAction)
          alertController.addAction(cancelAction)
          present(alertController, animated: true)
    }
}

extension ItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getItemList()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: CommonTableViewCell.cellIdentifier) as! CommonTableViewCell
        guard let itemList = presenter?.getItemList() else {
            return cell
        }
        cell.topLabel.text = itemList[indexPath.row].title
        cell.bottonLabel.text = DateFormatterUtil.getFomattedDate(date: itemList[indexPath.row].createdDate)
        cell.accessoryType = itemList[indexPath.row].done ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectItem(indexPath)
        itemTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension ItemViewController: ItemPresenterViewDelegate {
    func hideEmptyView(_ toShow: Bool) {
        emptyView.isHidden = toShow
    }
    
    func showLoading() {
        toggleLoading(isOn: true)
    }
    
    func hideLoading() {
        toggleLoading(isOn: false)
    }
    
    func setupUIViewElements() {
        itemTableView.register(UINib(nibName: CommonTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: CommonTableViewCell.cellIdentifier)
        itemTableView.rowHeight = UITableView.automaticDimension
        emptyView.isHidden = true
        title = ITEM_SCREEN_TITLE
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    func reloadData() {
        itemTableView.reloadData()
    }
    
    
}
