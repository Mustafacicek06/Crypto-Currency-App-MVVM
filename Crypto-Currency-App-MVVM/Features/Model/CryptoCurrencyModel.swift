//
//  CryptoCurrencyModel.swift
//  Crypto-Currency-App-MVVM
//
//  Created by Mustafa Çiçek on 21.08.2022.
//

import Foundation

// GET & POST = CODABLE
// just GET = Decodable
// just POST = Encodable
struct CryptoCurrencyModel: Decodable  {
    let currency: String?
    let price: String?
 
    
    
}

