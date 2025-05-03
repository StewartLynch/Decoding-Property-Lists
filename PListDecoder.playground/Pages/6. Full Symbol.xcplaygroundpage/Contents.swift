/*:
 [< Previous](@previous)                    [Home](0.%20Introduction)
 ## Full Symbol
>* We can create a struct representing a `Symbol` and create an array of these by decoding the plists.
>* The `Symbol` struct contains the symbol `name`, the `releaseYear`, an array of `categories` an array of `osVersions` and an array of `searchTerms`
*/

import Foundation

struct Category: Decodable {
    let icon: String
    let key: String
    let label: String
}

struct Symbol_Categories: Decodable {
    let name: String
    let categories: [String]
}

struct Symbol_SearchTerms: Decodable {
    let name: String
    let searchTerms: [String]
}

struct Symbol_Availability: Decodable {
    let symbols: [String : String]
    let year_to_release: [String : [String : String]]
}

struct OSVersion {
    let os: String
    let version: String
}

struct Symbol {
    let name: String
    let releaseYear: String
    let categories: [Category]
    let searchTerms: [String]
    let osVersions: [OSVersion]
}

func buildSymbolsArray() -> [Symbol] {
    var symbols = [Symbol]()
    let categories = decodePlist([Category].self, from: "categories")
    let symbolCategoriesDict = decodePlist([String : [String]].self, from: "symbol_categories")
    let symbolSearchTermsDict = decodePlist([String : [String]].self, from: "symbol_search")
    let symbolAvailability = decodePlist(Symbol_Availability.self, from: "name_availability")
    for (name, releaseYear) in symbolAvailability.symbols {
        let symbolCategoriesNames = symbolCategoriesDict[name] ?? []
        var symbolCategories = symbolCategoriesNames.compactMap({ name in
            categories.first(where: {$0.key == name})
        })
        let searchTerms = symbolSearchTermsDict[name] ?? []
        let osAvailabilityDict = symbolAvailability.year_to_release[releaseYear] ?? [:]
        let osVersions = osAvailabilityDict.map { os, version in
            OSVersion(os: os, version: version)
        }
        symbols.append(
            Symbol(
                name: name,
                releaseYear: releaseYear,
                categories: symbolCategories,
                searchTerms: searchTerms,
                osVersions: osVersions
            )
        )
    }
    return symbols
}

let symbols = buildSymbolsArray()
