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
        initDelegate()
        let myApiKey = "ae00a59a93623c9005482d4d573310e67e4b1434"
        let baseUrl =  URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        
        CryptoService.shared.downloadCurrencies(url: baseUrl!) { (cryptos) in
            if let cryptos = cryptos {
                print(cryptos)
            }
        }
      
        
    }
    
    private func initDelegate() {
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

