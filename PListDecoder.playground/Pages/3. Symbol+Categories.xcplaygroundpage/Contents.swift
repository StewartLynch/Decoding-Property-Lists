/*:
 [< Previous](@previous)                    [Home](0.%20Introduction)                    [Next >](@next)
 ## Symbols + Categories
>* Each symbol can have 0 or more categories.
>* The ***symbol_categories.plist*** is a dictionary where the key is the symbol name.
>* The value is an array of strings representing a category.
*/
import Foundation

struct Symbol_Categories: Decodable {
    let name: String
    let categories: [String]
}

let symbolCategoriesDict = decodePlist([String : [String]].self, from: "symbol_categories")
let symbolCategories = symbolCategoriesDict.map { name, categories in
    Symbol_Categories(name: name, categories: categories)
}

print(symbolCategories.count)
print(symbolCategories[10].name, symbolCategories[10].categories)
