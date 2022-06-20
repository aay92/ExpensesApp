//
//  ExpensesItemRealm.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 08.06.2022.
//

import SwiftUI
import RealmSwift

// modal
class ExpensesItemRealm: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var type: String
    @Persisted var amount: Int
    @Persisted var flag: Bool
}

class AllSummaUsers: ObservableObject {
    @Published var amountUsers = 0
    @Published var amountBusiness = 0
}
