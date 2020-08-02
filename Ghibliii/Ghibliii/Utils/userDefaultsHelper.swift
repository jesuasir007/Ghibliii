//
//  userDefaultsHelper.swift
//  Ghibliii
//
//  Created by Kevin Laminto on 2/8/20.
//

import Foundation

struct UserDefaultsHelper {
    
    /// This is the keys for every value. We can add a new key here if we need to asve any new value with new category.
    enum UserDefaultsKeys: String, CaseIterable {
        case test
    }
    
    private let defaults = UserDefaults.standard
    
    static let shared = UserDefaultsHelper()
    private init() { }
    
    /// Set the UserDefaults data to the device.
    /// - Parameters:
    ///   - value: The value that will be stored.
    ///   - key: The category of the value. (Unique, hence key)
    func setData<T>(value: T, key: UserDefaultsKeys) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    /// Get the data of the UserDefaults. This will return a generic type.
    /// - Parameters:
    ///   - type: The type of the supposed value. ie: Int.self, String.self, etc.
    ///   - key: The category.
    /// - Returns: The value either exist or not.
    func getData<T>(type: T.Type, forKey key: UserDefaultsKeys) -> T? {
        return defaults.object(forKey: key.rawValue) as? T
    }
    
    func removeData(key: UserDefaultsKeys) {
        defaults.removeObject(forKey: key.rawValue)
    }
}
