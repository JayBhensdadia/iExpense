//
//  Expence.swift
//  iExpence
//
//  Created by Jay Bhensdadia on 28/03/23.
//

import Foundation


class Expence : ObservableObject{
   
    @Published var items = [ExpenceItem](){
        didSet{
            if let encoded = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodeItems = try? JSONDecoder().decode([ExpenceItem].self, from: savedItems){
                items = decodeItems
                return
            }
            
        }
        items = []
    }
    
    func totalSpending() -> Double{
        if items.isEmpty{
            return 0.0
        }
        var ans : Double = 0.0
        for item in items{
            ans+=item.amount
        }
        return ans
    }
}
