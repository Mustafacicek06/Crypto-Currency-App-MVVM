//
//  JsonTableView.swift
//  Crypto-Currency-App-MVVM
//
//  Created by Mustafa Çiçek on 21.08.2022.
//

import Foundation
import UIKit

protocol CryptoTableViewProtocol {
    func update(items: CryptoCurrencyModel)
}

// just usage class weak
protocol CryptoTableViewOutputProtocol : class {
    func onSelected(item: CryptoCurrencyModel?)
}


// NSObject is just a trap to fetch the main methods of the tableView
final class CryptoTableView: NSObject{
    // my model
    private lazy var items: CryptoListViewModel? = nil
    
    /// Json table view output models
    weak var delegate: CryptoTableViewOutputProtocol?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath ) as! CryptoTableViewCell
        var cryptoViewModel = self.items?.getInListIndex(indexPath.row)
        cell.currencyText.text = cryptoViewModel?.cryptoName
        cell.priceText.text = cryptoViewModel?.cryptoPrice
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: (items?.cryptoCurrencyList[indexPath.row]))
    }
    
    
}

extension CryptoTableView : UITableViewDelegate, UITableViewDataSource {}
/*
extension CryptoTableView: CryptoTableViewProtocol {
    func update(items: [CryptoViewModel],index: Int) {
        self.items[index] = items
    }
}
*/
