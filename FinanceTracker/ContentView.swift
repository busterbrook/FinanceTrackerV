//
//  ContentView.swift
//  FinanceTracker
//
//  Created by Саня Якунин on 26.06.2023.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    let date = transactionListVM.acccumulateTransactions()
                    
                    if !date.isEmpty{
                        let totalExpensive = date.last?.1
                        CardView {
                            VStack(alignment: .leading){
                                ChartLabel((totalExpensive?.formatted(.currency(code: "USD")))!, type: .title, format: "$%.02f")
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                                .data(date)
                                .chartStyle(ChartStyle(backgroundColor: Color.background, foregroundColor: ColorGradient(Color.icon.opacity(0.4),Color.icon)))
                            .frame(height: 300)
                    }
                    
                    RecentTransactionList()
                    
                }.padding()
                    .frame(maxWidth: .infinity)
            }.background(Color.background)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem{
                        Image(systemName: "bell.badge")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.icon, .primary)
                    }
                }
        }.navigationViewStyle(.stack)
            .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }
        
}
