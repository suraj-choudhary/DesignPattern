//
//  SingleResponsibilityPrinciple.swift
//  DesignPattern
//
//  Created by suraj kumar on 10/12/23.
//

import Foundation
// MARK: Single Responsibilty principle---
/*
 A Class has just only one reason to change
 */

class Journal: CustomStringConvertible {
    var entries = [String]()
    var count = 0
    func addEnteries(_ text: String) -> Int {
        count += 1
        entries.append("\(count): \(text)")
        return count - 1
    }
    
    func removeEntries(_ index: Int) {
        entries.remove(at: index)
    }
    
    var description: String {
        return entries.joined(separator: "\n")
    }
    
    func save(_ fileName: String, _ override: Bool = false) {}
    
    func load(_ filename: String) {}
    
    func load(_ uri: URL) {}
}

class Persistance {
    func saveTofile(_ journal: Journal, _ fileName: String, _ override: Bool = false) {
        
    }
}


func SingleResponseibilityMain() {
    let j = Journal()
    let cried = j.addEnteries("I Cried today")
    _ = j.addEnteries("I ate a bug")
    print(j)
    j.removeEntries(cried)
    print("++++++++++")
    print(j)
}
