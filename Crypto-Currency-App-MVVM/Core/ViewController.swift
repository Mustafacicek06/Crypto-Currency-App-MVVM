//
//  ViewController.swift
//  Crypto-Currency-App-MVVM
//
//  Created by Mustafa Çiçek on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let jsonTableView: JsonTableView = JsonTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = jsonTableView
        tableView.delegate = jsonTableView
        jsonTableView.delegate = self
    }


}

extension ViewController: JsonTableViewOutputProtocol {
    func onSelected(item: Int) {
        print(item)
    }
    
    
}

