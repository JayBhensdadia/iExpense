//
//  ExpenceItem.swift
//  iExpence
//
//  Created by Jay Bhensdadia on 28/03/23.
//

import Foundation

struct ExpenceItem : Identifiable,Codable{
    var id  = UUID()
    let name : String
    let type : String
    let amount : Double
}
