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
    var dataManager = DataManager()
    var articles: [[String:Any]] = []
    
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
        
        // Fetch Data
        self.dataManager.fetchData { data in
            self.articles.append(data)
            self.tableView.reloadData()
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell ?? TableViewCell ()
        cell.titleLabel.text = articles[indexPath.row]["title"] as? String ?? ""
        guard let author = articles[indexPath.row]["aurthor"] as? [String:Any] else { return TableViewCell() }
        print(author)
        cell.autorNameLabel.text = author["name"] as? String ?? ""
        let timeStamp = articles[indexPath.row]["createdTime"]
        let date = Date(timeIntervalSince1970: timeStamp as? TimeInterval ?? 1480134638.0)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY/MM/dd"
        cell.createdTimeLabel.text = dateFormatter.string(from: date)
        cell.contentLabel.text = articles[indexPath.row]["content"] as? String ?? ""
        cell.categoryLabel.text = articles[indexPath.row]["category"] as? String ?? ""
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
    
    
    @IBAction func createArticle(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "PublishArticlePageViewController") as? PublishArticlePageViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

