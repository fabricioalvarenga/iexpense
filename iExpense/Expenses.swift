//
//  Expenses.swift
//  iExpense
//
//  Created by FABRICIO ALVARENGA on 28/07/22.
//

import Foundation

class Expenses: ObservableObject {
    let types = ["Personal", "Business", "Other"]
    
    @Published var items = [ExpenseItem]() {
        didSet {
            if let data = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(data, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
