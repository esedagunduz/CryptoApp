//
//  CoinRowView.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 7.12.2025.
//

import SwiftUI

struct CoinRowView: View {
    let coin:CoinModel
    let showHoldingColumn:Bool
    var body: some View {
        HStack(spacing:0) {
        leftColumn
            Spacer()
            if showHoldingColumn{
centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

#Preview("Light") {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColumn: true)

}

#Preview("Dark") {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColumn: true)
        .preferredColorScheme(.dark)
}
extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
       
        CoinImageView(coin: coin)
            .frame(width: 30,height: 30)
        Text("\(coin.symbol)".uppercased())
            .font(.headline)
            .padding(.leading,6)
            .foregroundStyle(Color.theme.accent)

        }
    }
    
    private var centerColumn:some View{
        VStack (alignment:.trailing){
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundStyle(Color.theme.accent)
        
    }
    
    private var rightColumn:some View{
        VStack (alignment: .trailing){
            Text(coin.currentPrice.asCurrencyWithDecimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0)>=0 ?
                    Color.green:
                        Color.red
                )
                
        
        }
        .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)

    }
}
