/*:
 [< Previous](@previous)                    [Home](0.%20Introduction)                   [Next >](@next)
 ## Symbols + Search
>* Each symbol can have 0 or more search terms.
>* The ***symbol_search.plist*** is a dictionary where the key is the symbol name.
>* The value is an array of strings representing a a search term.
*/

import Foundation

struct Symbol_SearchTerms: Decodable {
    let name: String
    let searchTerms: [String]
}

let symbolSearchTermsDict = decodePlist([String : [String]].self, from: "symbol_search")
let symbolSearchTerms = symbolSearchTermsDict.map { name, searchTerms in
    Symbol_SearchTerms(name: name, searchTerms: searchTerms)
}
print(symbolSearchTerms.count)
