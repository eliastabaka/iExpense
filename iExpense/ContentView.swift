//
//  ContentView.swift
//  iExpense
//
//  Created by Milosz Tabaka on 27/08/2022.
//

import SwiftUI

struct Singer: Encodable {
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    let person = Singer(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save user") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(person) {
                UserDefaults.standard.set(data, forKey: "singer")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
