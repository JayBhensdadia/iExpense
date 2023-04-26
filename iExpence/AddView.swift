//
//  AddView.swift
//  iExpence
//
//  Created by Jay Bhensdadia on 28/03/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @ObservedObject var expences: Expence
    
    let types = ["Business", "Personal"]
    var body: some View {
        NavigationView{
            ZStack{
//                Color(red: 171/255, green: 196/255, blue: 170/255)
//                .ignoresSafeArea()
                
                Form{
                    
                    Section{
                        TextField("Name",text: $name)
                        
                    }
                    
                    Section{
                        Picker("Type",selection: $type){
                            ForEach(types,id: \.self){
                                Text($0)
                            }
                            
                        }
                    }
                    Section{
                        TextField("Amount", value: $amount,format: .currency(code: "USD"))
                            .keyboardType(.decimalPad)
                    }
    
                    
                }
                
                
            }
            
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Save"){
                    let item = ExpenceItem(name: name, type: type, amount: amount)
                    expences.items.append(item)
                    dismiss()
                }
            }

        }
 
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expences: Expence())
    }
}
