//
//  PreviewData.swift
//  FinanceTracker
//
//  Created by Саня Якунин on 26.06.2023.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "26/06/2023", institution: "Desjardins", account: "Alex Yakunin", merchant: "Apple", amount: 11.49, type: "debit", categoryid: 801, category: "Software", isPending: false, isTranssfer: false, isExpensive: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)


