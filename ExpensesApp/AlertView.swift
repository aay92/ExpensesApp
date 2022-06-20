//
//  AlertView.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 17.06.2022.
//

import SwiftUI

struct AlertView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var isShowAlert: Bool
    @Binding var limitAlert: String
    var onDone: (String) -> Void = {_ in }
    
    let gradient = Gradient(colors: [.black, .pink])

    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.blue.opacity(0.7), .white.opacity(0.5)], startPoint: .top, endPoint: .bottom))
                .frame(width: 300, height: 200)
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                
            VStack{
                Text("Введите лимит")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white.opacity(1))
                    
                
                TextField("Введите", text: $limitAlert)
                    .padding()
                    .background(.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding()
                
                HStack(spacing: 50) {
                    Button {
                        onDone(self.limitAlert)
                        self.isShowAlert = false
                        limitAlert = ""

                    } label: {
                        Text("Установить")
                            .foregroundColor(.black.opacity(0.7))
                    }
                        Button {
                            limitAlert = ""
                            self.isShowAlert = false

                        } label: {
                            Text("Закрыть")
                                .foregroundColor(.black.opacity(0.7))
                        }
                    }

            }
            .frame(width: 300, height: 200, alignment: .center)
      
        }
        .frame(width: 300, height: 200, alignment: .center)
        .offset( y: isShowAlert ? 0 : 600)
        .animation(.spring())

    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(isShowAlert: .constant(true), limitAlert: .constant("0"))
    }
}
