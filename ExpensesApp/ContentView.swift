//
//  ContentView.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 08.05.2022.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(ExpensesItemRealm.self) var expanses
   

    @ObservedObject var allSummaUsers = AllSummaUsers()
    
    @State var amountUsers = ""
    
    
    
    @State var showAddedpoint = false
    
    //    CustomAlert
    @State private var isShowAlert: Bool = false
    @State private var limitAlert = ""
    @State private var limitItem: String = ""
    
    var remains: Double = 0.0
    
    //    Rings percentage
    @State private var percentageBlue: Double = 0.0
    @State private var percentageRed: Double = 0.0
    
    
    @State var allPersanalExpenses: Int = 0
    
    @State var isOn: Bool = false
    @State var showAddView = false
    
     var body: some View {
        
        
        ZStack{
            Color("AccentColor")
                .ignoresSafeArea()
           
            VStack {
                NavigationView {
                    VStack{
                        List(){
                            ForEach(expanses.sorted(by: [
                                SortDescriptor(keyPath: "flag", ascending: true)
                            ])){i in
                                ExpansesRow(name: i.name, type: i.type, amount: i.amount, flag: i.flag)
                                    .padding(5)
                                    .padding(.leading, 5)
                                    .padding(.trailing, 5)
                                    .cornerRadius(20)

                            }
                            .onDelete(perform: $expanses.remove)
                            .listRowSeparator(.hidden)

                        }
                        .listStyle(.sidebar)


                    }.navigationBarTitle("Расходы")
                        .background( Color("AccentColor"))
                }
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 420, height: 230)
                        .foregroundColor(.blue).opacity(0.3)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
                    
                    HStack(spacing:10) {
                        VStack {
                            HStack {
                                Text("Общая статистика")
                                    .font(.system(size: 25)).bold()
                                    .foregroundColor(.black).opacity(0.7)
                                
                                Image(systemName: "newspaper")
                                    .resizable()
                                    .frame(width: 28, height: 25, alignment: .center)
                                    .foregroundColor(.black)
                            }.frame(width: 270, height: 40)
                                .offset(x: 40, y: -20)
                            
                            if limitItem.isEmpty {
                                Text("Ваш лимит: \(limitItem)").hidden()
                                Text("Ваш остаток лимита:").hidden()
                                Text("\(Int(getRemains()))").hidden()
                                
                            } else {
                                Text("Ваш лимит: \(limitItem)").foregroundColor(.black.opacity(0.6))
                                Text("Ваш остаток лимита:").foregroundColor(.black.opacity(0.6))
                                Text("\(Int(getRemains()))").foregroundColor(.black.opacity(0.6))
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 190, height: 35)
                                    .foregroundColor(.blue).opacity(0.5)
                                    .shadow(color: .black.opacity(0.4), radius: 5, x: 3, y: 3)
                                    .offset(x: 0, y: -16)
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 35)
                                    .foregroundColor(.blue).opacity(0.2)
                                    .shadow(color: .black.opacity(0.4), radius: 5, x: 3, y: 3)
                                    .offset(x: -10, y: 22)
                                
                                ZStack {
                                    
                                    VStack {
                                        HStack {
                                            Button {
                                                isShowAlert = true
                                                
                                            } label: {
                                                Text("Добавить лимит")
                                                    .foregroundColor(.black)
                                                Image(systemName: "arrowshape.turn.up.right.circle.fill")
                                                    .renderingMode(.original)
                                                    .resizable()
                                                    .frame(width: 25, height: 25, alignment: .center)
                                            }
                                            
                                        }
                                        Button {
                                            limitItem = ""
                                            Text("Ваш лимит: \(limitItem)").hidden()
                                            Text("Ваш остаток лимита:").hidden()
                                            Text("\(Int(getRemains()))").hidden()
                                            
                                        } label: {
                                            Text("Сбросить")
                                                .foregroundColor(.black)
                                            Image(systemName: "delete.backward")
                                                .resizable()
                                                .frame(width: 22, height: 20, alignment: .center)
                                                .foregroundColor(.white.opacity(0.7))
                                        }
                                    }
                                }
                            }
                        }
                        
                        VStack {
                            ZStack{
                                Ring2(lineWidth: 25,
                                      backgroundColor: .red.opacity(0.4),foregroundColor: .red.opacity(0.7),percentage:percentageDataColor(limitItem: limitItem),
                                      animationDuration: 1.3
                                ).frame(width: 190, height: 190)
                                    .shadow(color: .yellow.opacity(0.5), radius: 1, x: 0, y: 0.4)
                                
                                Ring(lineWidth: 25,
                                     backgroundColor: .blue.opacity(0.6),foregroundColor: .blue, percentage: percentageDataColor(limitItem: limitItem),sumInCenter: getRealmUpdateDate(), animationDuration: 0.9)
                                .frame(width: 130, height: 130)
                                .shadow(color: .white.opacity(0.5), radius: 15, x: 0, y: 0.4)
                            }.offset(x: -24, y: 15)
                        }
                    }
                }
                
                Button(action: {
                    showAddView.toggle()
                    
                }, label: {
                    Image(systemName: "plus")
                        .padding()
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(50)
                        .offset(x: 0, y: -40)
                })
                .sheet(isPresented: $showAddView, content: {
                    AddView(allPersanalExpenses: $allPersanalExpenses, isOn: $isOn)
                        .environmentObject(allSummaUsers)
                }
                )
            }
            ZStack {
                AlertView(isShowAlert: $isShowAlert, limitAlert: $limitAlert) { data in
                    limitItem = data
                    print("\(limitItem)")
                }
            }
        }
     }
    
    private func getRemains()-> Double {
        let user = getRealmUpdateDate()
        let num = (Double(limitItem) ?? 0.0) - Double(user)
        return num
    }
    
    private func getRealmUpdateDate()-> Int{
        let realm = try! Realm()
        let amount: Int = realm.objects(ExpensesItemRealm.self).sum(ofProperty: "amount")
        return amount
    }
    
    private func percentageDataColor(limitItem: String)-> Double {
        var percentage = 0
        let user = getRealmUpdateDate()

        if !limitItem.isEmpty {
            if Int(limitItem) == 0 { return 1 }
            guard let limit = Int(limitItem) else { return 1 }
          
            percentage = ((user * 100) / limit)
            return Double(percentage)
        }
        return Double(percentage)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(remains: 0.0)
    }
}

