//
//  ExpensesAppApp.swift
//  ExpensesApp
//
//  Created by Aleksey Alyonin on 08.05.2022.
//

import SwiftUI

@main
struct ExpensesAppApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView(remains: 0.0)
                .onAppear {
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
        }
    }
}
