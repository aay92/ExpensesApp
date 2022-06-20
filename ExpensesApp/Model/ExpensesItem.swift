//
//  ExpensesItem.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 08.05.2022.
//

//import SwiftUI
//import RealmSwift
//
////view modal
//class ExpensesItem: ObservableObject {
//    @Published var id = UUID()
//    @Published var name = ""
//    @Published var type = ""
//    @Published var amount = 0
//    @Published var flag = false
//    
//    @Published var expenses: [ExpensesItemRealm] = []
//    
//    init() {
//        fetchData()
//    }
//  
//    func fetchData(){
//        guard let bdRef = try? Realm() else { return }
//        let results = bdRef.objects(ExpensesItemRealm.self)
//        self.expenses = results.compactMap({ (expanse)-> ExpensesItemRealm? in
//            return expanse
//        })
//    }
//    func  addData( ) {
//        let expense = ExpensesItemRealm()
//        expense.name = name
//        expense.type = type
//        expense.amount = amount
//        expense.flag = flag
//        
//        guard let bdRef = try? Realm() else { return }
//        
//        try? bdRef.write{
//            bdRef.add(expense)
//            fetchData()
//        }
//    }
//    
//    
//}
//
//struct SumAmount: Codable {
//    var amountUsers: Int
//    var amountBusiness: Int
//}
//
//
