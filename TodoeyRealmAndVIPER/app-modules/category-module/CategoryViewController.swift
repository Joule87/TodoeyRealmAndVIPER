//
//  CategoryViewController.swift
//  TodoeyRealmAndVIPER
//
//  Created by Julio Collado on 9/19/19.
//  Copyright © 2019 Julio Collado. All rights reserved.
//

import UIKit
import SwipeCellKit

class CategoryViewController: BaseViewController {
    
    @IBOutlet weak var categoryTableView: UITableView!

    var presenter: CategoryViewPresenterDelegate?
    let CATEGORY_SCREEN_TITLE = "Categories"
    static let viewControllerIdentifier = "CategoryViewController"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.notifyViewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.notifyViewWillAppear()
    }
    
    @objc func addCategory() {
        var textField = UITextField()
        let alertController = UIAlertController(title: "Add Category", message: nil, preferredStyle: .alert)
        alertController.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a category"
            textField = alertTextField
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] alertAction in
            if let categoryName = textField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines), categoryName.count > 0 {
                self?.presenter?.addNewCategory(categoryName: categoryName)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { [weak self] alertAction in
            self?.dismiss(animated: true)
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    override func updateModel(indexPath: IndexPath) {
        presenter?.deleteCategory(at: indexPath)
    }
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categoryList = presenter?.getCategoryList()
        return categoryList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: CommonTableViewCell.cellIdentifier) as! CommonTableViewCell
        guard let categoryList = presenter?.getCategoryList() else {
            return cell
        }
        cell.delegate = self
        cell.topLabel.text = categoryList[indexPath.row].name
        cell.bottonLabel.text = DateFormatterUtil.getFomattedDate(date: categoryList[indexPath.row].createdDate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.categorySelected(indexPath)
        categoryTableView.deselectRow(at: indexPath, animated: true)
    }


}

extension CategoryViewController: CategoryPresenterViewDelegate {
    func showLoading() {
        toggleLoading(isOn: true)
    }

    func hideLoading() {
        toggleLoading(isOn: false)
    }

    func setupUIViewElements() {
        categoryTableView.register(UINib(nibName: CommonTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: CommonTableViewCell.cellIdentifier)
        categoryTableView.rowHeight = UITableView.automaticDimension
        title = CATEGORY_SCREEN_TITLE
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCategory))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    func reloadData() {
        animateReloadData(for: categoryTableView)
    }

}
