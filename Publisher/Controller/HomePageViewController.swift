//
//  ViewController.swift
//  Publisher
//
//  Created by Eric chung on 2022/4/2.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView Data Source
        tableView.dataSource = self
        
        // tableViewCell
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        // Nav Controller
        configNavItem ()
        
        // Button
        configButton()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell ?? TableViewCell ()
        return cell
    }
    
    func configNavItem () {
        self.navigationItem.title = "Publisher"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.standardAppearance = appearance;
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }
    
    func configButton () {
        buttonLabel.backgroundColor = .systemBlue
        buttonLabel.layer.cornerRadius = buttonLabel.bounds.width / 2
        buttonLabel.setTitle("+", for: .normal)
        buttonLabel.tintColor = .white
    }
    
}

