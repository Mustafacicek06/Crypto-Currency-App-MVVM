//
//  CryptoService.swift
//  Crypto-Currency-App-MVVM
//
//  Created by Mustafa Çiçek on 21.08.2022.
//

import Foundation


class CryptoService {
    static let shared = CryptoService()
    
    private init () {}
    
    
    func downloadCurrencies(url: URL, completion: @escaping ( [CryptoCurrencyModel]? ) -> ()) {
       URLSession.shared.dataTask(with: url) { data, response, error in
           
            if let error = error {
                print(error.localizedDescription)
                print(response)
                completion(nil)
            } else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurrencyModel].self, from: data)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
        
        
        
    }
}
