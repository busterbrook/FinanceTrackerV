//
//  FinanceTrackerApp.swift
//  FinanceTracker
//
//  Created by Саня Якунин on 26.06.2023.
//

import SwiftUI

@main
struct FinanceTrackerApp: App {
    
    @StateObject var transacctionsListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transacctionsListVM)
        }
    }
}
