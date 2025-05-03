//
//----------------------------------------------
// Original project: 
// by  Stewart Lynch on 2025-05-03
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.

import Foundation

public func decodePlist<T:Decodable>(_ type: T.Type, from fileName: String) -> T {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "plist") else {
        fatalError("Failed to locate \(fileName)")
    }
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Failed to load \(fileName) from bundle")
    }
    let decoder = PropertyListDecoder()
    guard let decodedData = try? decoder.decode(T.self, from: data) else {
        fatalError("Failed to decode \(fileName) from bundle")
    }
    return decodedData
}
