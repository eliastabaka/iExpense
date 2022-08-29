//
//  ContentView.swift
//  iExpense
//
//  Created by Milosz Tabaka on 27/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                if item.amount < 100 {
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .foregroundColor(item.amount < 10 ? .green : .yellow)
                                } else {
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            
                
                Section {
                    ForEach(expenses.items) { item in
                        if item.type != "Personal" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                if item.amount < 100 {
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .foregroundColor(item.amount < 10 ? .green : .yellow)
                                } else {
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
