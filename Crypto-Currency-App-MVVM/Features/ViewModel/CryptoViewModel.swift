//
//  CryptoViewModel.swift
//  Crypto-Currency-App-MVVM
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation

// artık apple viewModel'leri daha simple'laştırmaya çalışıyor
// sende buna özen göster
struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrencyModel]
    
}

extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func getInListIndex(_ index: Int) -> CryptoViewModel {
        let cryptoModel = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: cryptoModel)
    }
    
}

struct CryptoViewModel {
    let cryptoCurrency: CryptoCurrencyModel
    
    
}
extension CryptoViewModel {
    
    lazy var cryptoName: String? = {
        return self.cryptoCurrency.currency ?? nil
    }()
    
    lazy var cryptoPrice: String? = {
        return self.cryptoCurrency.price ?? nil
    }()

}
