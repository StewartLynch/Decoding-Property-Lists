/*:
 [< Previous](@previous)                    [Home](0.%20Introduction)                    [Next >](@next)
 ## Categories
>* Symbols can be categorized.
>* The ***categories.plist*** is an array of dictionaries with 3 key-value pairs.
>* The key-value pairs represent the `icon`, the symbol name, the `key` representing the category and `label` representing a readable representation of the key.
*/
import Foundation

struct Category: Decodable {
    let icon: String
    let key: String
    let label: String
}

let categories = decodePlist([Category].self, from: "categories")
print(categories.count)
categories.forEach { category in
    print(category.label)
}
