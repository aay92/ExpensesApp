//
//  ExpansesRow.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 09.06.2022.
//

import SwiftUI

struct ExpansesRow: View {
    
    var name: String
    var type: String
    var amount: Int
    var flag: Bool
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: flag ? "flag.fill" : "")
                .foregroundColor(.red)
            
            VStack(alignment: .leading) {
                
                Text("\(name)")
                    .font(.headline)
                Text("\(type)")
                    .font(.caption2)
            }
            Spacer()
            Text("\(amount) Руб")
        }
    }
}

struct ExpansesRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpansesRow(name:"", type: "", amount: 0, flag: false)
    }
}
