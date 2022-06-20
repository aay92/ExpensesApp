//
//  ExpansesView.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 09.06.2022.
//

//import SwiftUI
//import RealmSwift
//
//struct ExpansesView: View {
////    @StateObject var modalManager = ExpensesItem()
//
//    @ObservedResults(ExpensesItemRealm.self) var expanses
//
////    @ObservedRealmObject var expanses: ExpensesItemRealm
//
////    @EnvironmentObject var realManager: RealManager
//
//    var body: some View {
//
//        Text("Pum")
//        List{
//            ForEach(expanses){ item in
//                ExpansesRow(name: item.name, type: item.type, amount: item.amount, flag: item.flag)
//            }
//            .padding(5)
//            .padding(.leading, 5)
//            .padding(.trailing, 5)
//            .cornerRadius(20)
//        }
//    }
//}
//
//struct ExpansesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpansesView()
////            .environmentObject(RealManager())
//
//    }
//}
