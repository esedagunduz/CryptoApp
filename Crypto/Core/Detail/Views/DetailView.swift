//
//  DetailsView.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 15.12.2025.
//

import SwiftUI

struct DetailLoadingView:View {
    @Binding var coin:CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin{
                DetailView(coin: coin)
            }
        }
        
    }
}

struct DetailView: View {
    @StateObject var vm:DetailViewModel
    init(coin:CoinModel){
        print("initialized coin\(coin.name)")
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    var body: some View {
        Text("hello")
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.instance.coin)
}
