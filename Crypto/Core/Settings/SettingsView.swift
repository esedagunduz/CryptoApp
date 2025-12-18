//
//  SettingsView.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 18.12.2025.
//


import SwiftUI

struct SettingsView: View {
    
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    appInfoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    
                    featuresSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    
                    dataSourceSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    
                    tipsSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Information")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}


extension SettingsView {
    
    private var appInfoSection: some View {
        Section(header: Text("About the App")) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.orange)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Crypto Tracker")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.theme.accent)
                    }
                }
                
                Text("Track cryptocurrency markets in real-time, manage your portfolio, and monitor price changes. Built with SwiftUI using MVVM architecture, Combine, and CoreData.")
                    .font(.callout)
                    .foregroundColor(Color.theme.accent)
                    .padding(.top, 4)
            }
            .padding(.vertical, 8)
        }
    }
    
    private var featuresSection: some View {
        Section(header: Text("Features")) {
            FeatureRow(
                icon: "chart.line.uptrend.xyaxis",
                color: .blue,
                title: "Live Prices",
                description: "View real-time prices of 2000+ cryptocurrencies"
            )
            
            FeatureRow(
                icon: "briefcase.fill",
                color: .green,
                title: "Portfolio Management",
                description: "Create and track your own portfolio"
            )
            
            FeatureRow(
                icon: "arrow.up.arrow.down",
                color: .orange,
                title: "Sorting",
                description: "Sort coins by rank, price, or holdings"
            )
            
            FeatureRow(
                icon: "magnifyingglass",
                color: .purple,
                title: "Search",
                description: "Easily find the coin you're looking for"
            )
            
            FeatureRow(
                icon: "chart.xyaxis.line",
                color: .red,
                title: "Detailed Charts",
                description: "Analyze price movements with interactive charts"
            )
        }
    }
    
    private var dataSourceSection: some View {
        Section(header: Text("Data Source")) {
            VStack(alignment: .leading, spacing: 12) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Text("All cryptocurrency data in this app is provided using CoinGecko's free API. Prices may be slightly delayed.")
                    .font(.callout)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical, 8)
            
            Link(destination: coingeckoURL) {
                HStack {
                    Text("Visit CoinGecko")
                        .foregroundColor(Color.theme.accent)
                    Spacer()
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    private var tipsSection: some View {
        Section(header: Text("Usage Tips")) {
            VStack(alignment: .leading, spacing: 12) {
                TipRow(
                    icon: "hand.tap.fill",
                    tip: "Tap on a coin to view its detail page"
                )
                
                TipRow(
                    icon: "plus.circle.fill",
                    tip: "Press the '+' button while in Portfolio view to add coins"
                )
                
                TipRow(
                    icon: "arrow.clockwise",
                    tip: "Refresh data by tapping the arrow button in the top right"
                )
                
                TipRow(
                    icon: "arrow.left.arrow.right",
                    tip: "Switch between Live Prices and Portfolio using the chevron"
                )
                
                TipRow(
                    icon: "text.alignleft",
                    tip: "Tap column headers to sort the list"
                )
            }
            .padding(.vertical, 8)
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let color: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.accent)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
        .padding(.vertical, 4)
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Spacer()
            Text(value)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(Color.theme.accent)
        }
    }
}

struct TipRow: View {
    let icon: String
    let tip: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(.blue)
                .frame(width: 20)
            
            Text(tip)
                .font(.caption)
                .foregroundColor(Color.theme.accent)
        }
    }
}

