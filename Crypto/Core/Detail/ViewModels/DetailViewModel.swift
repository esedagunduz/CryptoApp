//
//  DetailViewModel.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 15.12.2025.
//

import Foundation
import Combine
class DetailViewModel:ObservableObject{
    private let coinDetailDataService:CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin:CoinModel){
        self.coinDetailDataService = CoinDetailDataService(coin:coin)
        self.addSubsription()
        }
    private func addSubsription(){
        coinDetailDataService.$coinDetails
            .sink { (returnedCoinDetails) in
                print("Received coin detail data")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
        
    }
    
    
}
