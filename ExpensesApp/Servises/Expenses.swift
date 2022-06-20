//
//  Expenses.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 10.05.2022.
//

//import SwiftUI
//
//class Expenses: ObservableObject {
//    
//   
//
//    @Published var items = [ExpensesItem]() {
//        didSet{
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "items")
//            }
//        }
//    }
//
//
//    init(){
//        if let items = UserDefaults.standard.data(forKey: "items") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode([ExpensesItem].self, from: items) {
//                self.items = decoded
//            }
//            return
//        }
//        if let amountUsers = UserDefaults.standard.data(forKey: "amountUsers") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode(SumAmount.self, from: amountUsers) {
//                self.amountUsers = decoded
//            }
//            return
//        }
//        if let amountBusiness = UserDefaults.standard.data(forKey: "amountBusiness") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode(SumAmount.self, from: amountBusiness) {
//                self.amountBusiness = decoded
//            }
//            return
//
//        }
//    }
//}

