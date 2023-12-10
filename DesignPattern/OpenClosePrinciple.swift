//
//  OpenClosePrinciple.swift
//  DesignPattern
//
//  Created by suraj kumar on 10/12/23.
//

import Foundation

/*
 A class should be open for Extension closed for modification
 */
// MARK: Open closed principle
enum Color {
    case red
    case green
    case blue
}

enum ProductSize {
    case small
    case medium
    case large
    case yuge
}

class Product {
    var name: String
    var color: Color
    var size: ProductSize
    init(name: String, color: Color, size: ProductSize) {
        self.name = name
        self.color = color
        self.size = size
    }
}


class ProductFilter {
    
    /// Description
    /// - Parameters:
    ///   - product: product description
    ///   - color: color description
    /// - Returns: description
    func filterByColor(_ product: [Product], _ color: Color) -> [Product] {
        var result = [Product]()
        for p in product {
            if p.color == color {
                result.append(p)
            }
        }
        return result
    }
    
    /// Description
    /// - Parameters:
    ///   - product: product description
    ///   - size: size description
    /// - Returns: description
    func filterBySize(_ product: [Product], _ size: ProductSize) -> [Product] {
        var result = [Product]()
        for p in product {
            if p.size == size {
                result.append(p)
            }
        }
        return result
    }
    
    
    /// Description
    /// - Parameters:
    ///   - product: product description
    ///   - size: size description
    /// - Returns: description
    func filterBySizeAndColor(_ product: [Product], _ size: ProductSize, color: Color) -> [Product] {
        var result = [Product]()
        for p in product {
            if (p.size == size) && (p.color == color) {
                result.append(p)
            }
        }
        return result
    }
    
}


func OCPMainOld() {
    let apple = Product(name: "Apple", color: .green, size: .large)
    let tree = Product(name: "Tree", color: .green, size: .large)
    let house = Product(name: "House", color: .blue, size: .large)
    
    let products = [apple, tree, house]
    let productFiler = ProductFilter()
    print("Green products (Old):")
    
    for p in productFiler.filterByColor(products, .green) {
        print("- \(p.name) is green")
    }
}
/// Specification

protocol Specification {
    associatedtype T
    func isSatisfied(_ item: T) -> Bool
}

protocol Filter {
    associatedtype T
    func filter<Spec: Specification>(_ items: [T], _ spec: Spec) -> [T] where Spec.T == T
}

class ColorSpecification: Specification {
   
    
    typealias T = Product
    let color: Color
    init(_ color: Color) {
        self.color = color
    }
    
    func isSatisfied(_ item: Product) -> Bool {
      return true
    }
}
