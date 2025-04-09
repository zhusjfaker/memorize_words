//
//  index.swift
//  memorize_words
//
//  Created by 朱仕杰 on 2025/4/14.
//

import Foundation
import KeychainAccess

class KeychainManager {
    static let shared = KeychainManager()
    private let keychain = Keychain(service: "com.yourapp.identifier")

    func saveToken(_ token: String) {
        try? keychain.set(token, key: "userToken")
    }

    func getToken() -> String? {
        try? keychain.get("userToken")
    }

    func deleteToken() {
        try? keychain.remove("userToken")
    }
}
