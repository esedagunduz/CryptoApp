//
//  CoinImageView.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 9.12.2025.
//

import SwiftUI
struct CoinImageView: View {
    
    @StateObject var vm :CoinImageViewModel
    init(coin:CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    var body: some View {
        ZStack {
           if let image = vm.image{
               Image(uiImage:image)
                   .resizable()
           }else if vm.isLoading{
               ProgressView()
               
               
           }else{
               Image(systemName: "questionark")
                   .foregroundStyle(Color.theme.secondaryText)
               
           }
        }
    }
}

#Preview {
    CoinImageView(coin: DeveloperPreview.instance.coin)
}
