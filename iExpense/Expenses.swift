//
//  Expenses.swift
//  iExpense
//
//  Created by Milosz Tabaka on 28/08/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
