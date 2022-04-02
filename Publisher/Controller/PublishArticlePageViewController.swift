//
//  PublishArticlePageViewController.swift
//  Publisher
//
//  Created by Eric chung on 2022/4/2.
//

import UIKit

class PublishArticlePageViewController: UIViewController {
    
    var dataManager = DataManager()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(closePageWithLeftItem))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc func closePageWithLeftItem () {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func createData(_ sender: Any) {
        dataManager.createData(categoryTextField.text ?? "", contentTextField.text ?? "", titleTextField.text ?? "")
    }
    

}
