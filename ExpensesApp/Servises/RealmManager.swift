//
//  RealmManager.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 08.06.2022.
//
//
//import Foundation
//import RealmSwift
//
//
//class RealManager: ObservableObject {
//    
//    private(set) var localRealm: Realm?
//    @Published private(set) var expenses: [ExpensesItemRealm] = []
//    
//    init(){
//        openRealm()
//    }
//    
//    func openRealm(){
//        do {
//            let config = Realm.Configuration(schemaVersion: 1)
//            Realm.Configuration.defaultConfiguration = config
//            localRealm = try Realm()
//        } catch {
//            print("Error from open real store: \(error)")
//        }
//    }
//    
//    func addExpenses(name: String, type: String, amount: Int, flag: Bool){
//        if let localRealm = localRealm {
//            do{
//                try localRealm.write{
//                    let newExpenses = ExpensesItemRealm(value: ["name": name, "type": type,"amount": amount, "flag": flag ])
//                    localRealm.add(newExpenses)
//                    getExpenses()
//                    print("Added new Expanses in Realm: \(newExpenses)")
//                }
//            } catch {
//                print("Error in added in realm: \(error)")
//            }
//        }
//    }
//    
//    func getExpenses(){
//        if let localRealm = localRealm {
//            let allExpanses = localRealm.objects(ExpensesItemRealm.self)
//            expenses = []
//            allExpanses.forEach { expanse in
//                expenses.append(expanse)
//            }
//        }
//    }
//    
//    func updateExpanses(id: ObjectId, flag: Bool){
//        if let localRealm = localRealm {
//            do {
//                let expansesUpdate = localRealm.objects(ExpensesItemRealm.self).filter(NSPredicate(format: "id == %@", id))
//                guard !expansesUpdate.isEmpty else { return }
//                
//                try localRealm.write{
//                    expansesUpdate[0].flag = flag
//                    getExpenses()
//                    print("Updates expanses with id: \(id)! Flag: \(flag)")
//                }
//            } catch {
//                print("Error updatind expanses \(id) error: \(error)")
//            }
//        }
//    }
//    
//    func deleteExpenses(id: ObjectId){
//        if let localRealm = localRealm {
//            do {
//                let expansesDelete = localRealm.objects(ExpensesItemRealm.self).filter(NSPredicate(format: "id == %@", id))
//                guard !expansesDelete.isEmpty else { return }
//                try localRealm.write{
//                    localRealm.delete(expansesDelete)
//                    getExpenses()
//                    print("Deleting expanses with ad \(id)")
//                }
//                
//                
//            } catch {
//                print("Deleting task expanses \(error), with id: \(id)")
//            }
//        }
//    }
//}
