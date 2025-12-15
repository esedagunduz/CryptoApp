//
//  HomeView.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 5.12.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfolio:Bool = false
    @State private var showPortfolioView:Bool = false
    @EnvironmentObject var vm:HomeViewModel
    
    
    @State private var selectedCoin:CoinModel?
    @State private var showDetailView:Bool = false
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented:$showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            
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
        .background(
            NavigationLink(destination: DetailLoadingView(coin: $selectedCoin), isActive: $showDetailView, label: {EmptyView()
                
            })
        )
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
                .onTapGesture {
                    if showPortfolio{
                        showPortfolioView.toggle()
                        
                    }
                }
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
                onTapGesture {
                    segue(coin: coin)
                }

            }
        }
        .listStyle(.plain)
    }
    private var portfolioCoinsList:some View{
        List{
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top:10,leading: 0,bottom: 10,trailing: 10))
                onTapGesture {
                    segue(coin: coin)
                }
            }
        }
        .listStyle(.plain)
    }
    private func segue(coin:CoinModel){
        selectedCoin = coin
        showDetailView.toggle()
        
    }
    
    private var columnTitles:some View{
        HStack{
            HStack(spacing:4){
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                onTapGesture {
                    withAnimation(.default){
                        vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                    }
                }
            }
            Spacer()
            if showPortfolio{
                HStack(spacing:4){
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0:180))
                    onTapGesture {
                        withAnimation(.default){
                            vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed: .holdings
                        }
                    }

                    
                }
            }
            HStack(spacing:4){
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0:180))
                onTapGesture {
                    withAnimation(.default){
                        vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                    }
                }

            }

                .frame(width: UIScreen.main.bounds.width / 3.5,alignment: .trailing)
            Button {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }.rotationEffect(Angle(degrees: vm.isLoading ? 360:0),anchor: .center)

        }.font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
            .padding(.horizontal)
    }
}
