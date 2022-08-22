//
//  ViewController.swift
//  Crypto-Currency-App-MVVM
//
//  Created by Mustafa Çiçek on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private let cryptoTableView: CryptoTableView = CryptoTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initDelegate()
        let myApiKey = "ae00a59a93623c9005482d4d573310e67e4b1434"
        let baseUrl =  URL(string: "https://api.nomics.com/v1/currencies/ticker?key=\(myApiKey)")
        
        CryptoService.shared.downloadCurrencies(url: baseUrl!) { (cryptos) in
            if let cryptos = cryptos {
                print(cryptos)
            }
        }
      
        
    }
    
    private func initDelegate() {
        tableView.dataSource = cryptoTableView
        tableView.delegate = cryptoTableView
        // cryptoTableView.delegate = self
    }


}
/*
extension ViewController: CryptoTableViewOutputProtocol {
    func onSelected(item: Int) {
        print(item)
    }
    

}
*/
