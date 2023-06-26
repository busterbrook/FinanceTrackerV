//
//  TransactionModel.swift
//  FinanceTracker
//
//  Created by Саня Якунин on 26.06.2023.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryid: Int
    var category: String
    var isPending: Bool
    var isTranssfer: Bool
    var isExpensive: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode{
        if let category = Category.all.first (where: {$0.id == categoryid}) {
            return category.icon
        }
        return .question
    }
    
    var dateParsed: Date{
        date.dateParsed()
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}
enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}

struct Category{
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category{
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertaiment = Category(id: 3, name: "Enterteiment", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charge", icon: .hand_holding_usd)
    static let foodAndDinig = Category(id: 5, name: "Food & Dinig", icon: .hamburger)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name:"Shopping", icon: .shopping_cart)
    static let tranfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    static let publicTranspotation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile phone", icon: .mobile_alt, mainCategoryId: 2)
    static let movies = Category(id: 301, name: "Movies", icon: .film, mainCategoryId: 3)
    static let financeCarge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurans = Category(id: 502, name: "Restaurans", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", icon: .dollar_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Softtware", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: 9)
}

extension Category{
    static let categories: [Category] = [
        .autoAndTransport,
            .billsAndUtilities,
            .entertaiment,
            .feesAndCharges,
        .foodAndDinig,
            .home,
            .income,
            .shopping,
            .tranfer]
    
    static let subCategories: [Category] = [
        .publicTranspotation,
        .taxi,
        .mobilePhone,
        .movies,
        .financeCarge,
        .groceries,
        .restaurans,
        .rent,
        .homeSupplies,
        .paycheque,
        .paycheque,
        .software,
        .software
    ]
    
    static let all: [Category] = categories + subCategories
}


