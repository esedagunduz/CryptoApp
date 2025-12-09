//
//  HomeView.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 5.12.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfolio:Bool = true
    @EnvironmentObject var vm:HomeViewModel
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack{
                
                HomeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText:$vm.searchText )
                columnTitles
                
                if !showPortfolio{
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                
                Spacer(minLength: 0)
            }
            
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }.environmentObject(DeveloperPreview.instance.homeVm)
    
}
extension HomeView{
    private var HomeHeader:some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus":"info")
                .animation(.none)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio":"Live Prices")
                .animation(.none)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180:0))
                .onTapGesture {
                    
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
    }
    
    private var allCoinsList:some View{
        List{
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top:10,leading: 0,bottom: 10,trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    private var portfolioCoinsList:some View{
        List{
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top:10,leading: 0,bottom: 10,trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    
    private var columnTitles:some View{
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
        }.font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
            .padding(.horizontal)
    }
}
