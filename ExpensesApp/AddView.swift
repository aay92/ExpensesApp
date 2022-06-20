//
//  AddView.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 08.05.2022.
//

import SwiftUI
import RealmSwift




struct AddView: View {
    
    
    @EnvironmentObject var allSummaUsers: AllSummaUsers
    
    @Binding var allPersanalExpenses: Int

    let realm = try! Realm()
    
    @Binding var isOn: Bool
    @Environment( \.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = ""
    @State private var amount = ""
    @State private var flag : Bool = false
    
//    @Binding var amountUsers: Int
//    @Binding var amountBusiness: Int
    
    let types = ["Рабочие","Личные"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Название", text: $name)
                Picker("Тип расходов", selection: $type){
                    ForEach(types, id: \.self){ index in
                        Text("\(index)")
                    }
                    
                }
                .pickerStyle(.automatic)
                TextField("Стоимость", text: $amount )
                    .keyboardType(.numberPad)
                
                HStack {
                    Toggle(isOn: $isOn) {
                        Text("Важность")
                       
                    }.colorMultiply(isOn ? .red : .gray)
                    Text(isOn ? "Важная" : "Обычная")
                        .padding()
                        .foregroundColor( isOn ? .red : .gray)
                }

            }
            .navigationTitle("Добавить")
            .navigationBarItems( trailing: Button("Cохранить"){
                if Int(self.amount) != nil{
                    
                    if isOn {
                        isOn.toggle()
                        flag.toggle()
                    
                    }
                    _ = Realm.Configuration(
                                schemaVersion: 9,
                                migrationBlock: { migration, oldSchemaVersion in
                                    if (oldSchemaVersion < 1) {}
                            })
// MARK: Added new object in Realm
                    let newExpanse = ExpensesItemRealm()
                    newExpanse.name = name
                    newExpanse.type = type
                    newExpanse.amount = Int(amount) ?? 0
                    newExpanse.flag = flag
                    
                    do {
                        try! realm.write {
                            realm.add(newExpanse)
                        }
                    }
// MARK: Sum all expenses
                    allPersanalExpenses = realm.objects(ExpensesItemRealm.self).sum(ofProperty: "amount")
                    $allSummaUsers.amountUsers.wrappedValue = allPersanalExpenses
                    self.presentationMode.wrappedValue.dismiss()
                }
            }.foregroundColor(.black)
            )
        }.environmentObject(allSummaUsers)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(allPersanalExpenses:.constant(0), isOn: .constant(false))
            .environmentObject(AllSummaUsers())
    }
}
