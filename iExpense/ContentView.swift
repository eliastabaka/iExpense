//
//  ContentView.swift
//  iExpense
//
//  Created by Milosz Tabaka on 27/08/2022.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    var name: String
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
    }
}
struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Showing sheet") {
            showingSheet.toggle()
        }
        
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "some name")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
