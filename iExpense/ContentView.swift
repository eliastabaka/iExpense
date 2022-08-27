//
//  ContentView.swift
//  iExpense
//
//  Created by Milosz Tabaka on 27/08/2022.
//

import SwiftUI

class Person {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}


struct ContentView: View {
    @State private var hobbit = Person()
    
    var body: some View {
        VStack {
            Text("\(hobbit.firstName) \(hobbit.lastName)")
            TextField("firstName", text: $hobbit.firstName)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
