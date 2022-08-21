//
//  JsonTableView.swift
//  Crypto-Currency-App-MVVM
//
//  Created by Mustafa Çiçek on 21.08.2022.
//

import Foundation
import UIKit

protocol JsonTableViewProtocol {
    func update(items: [Int])
}

// just usage class weak
protocol JsonTableViewOutputProtocol : class {
    func onSelected(item: Int)
}


// NSObject is just a trap to fetch the main methods of the tableView
final class JsonTableView: NSObject{
    // my model
    private lazy var items: [Int] = []
    
    weak var delegate: JsonTableViewOutputProtocol?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
    
}

extension JsonTableView : UITableViewDelegate, UITableViewDataSource {}
extension JsonTableView: JsonTableViewProtocol {
    func update(items: [Int]) {
        
    }
}

