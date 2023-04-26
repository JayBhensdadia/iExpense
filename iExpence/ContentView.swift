//
//  ContentView.swift
//  iExpence
//
//  Created by Jay Bhensdadia on 28/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expences = Expence()
    @State private var showingAddView = false
    
    var body: some View {
        
        NavigationStack{
            ZStack{

                VStack{
                    Text("Total Spending : \(expences.totalSpending().formatted())")
                        .font(.title)
                        .fontWeight(.bold)
                    List{
                        ForEach(expences.items){ item in
                            HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                    }

                                    Spacer()
                                    Text(item.amount, format: .currency(code: "USD"))
                                }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                

            }
            .toolbar{
                Button{
                    showingAddView = true
                }label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .fontWeight(.heavy)
                        
                }
            }
        }
        .sheet(isPresented: $showingAddView){
            AddView(expences: expences)
        }
    
    }
    
    func removeItems(at offset : IndexSet){
        expences.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
