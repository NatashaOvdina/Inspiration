//
//  StorageManager.swift
//  Inspiration
//
//  Created by Natalia Ovdina on 22.02.2024.
//

import Foundation
import RealmSwift

final class StorageManager {
    static let shared = StorageManager()
    
    private let realm: Realm
    
    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    
    // MARK: - Quote
    
    func fetchData<T>(_ type: T.Type) -> Results<T> where T: RealmFetchable {
        realm.objects(T.self)
    }
    
    func save(_ quote: Quote) {
        write {
            realm.add(quote)
        }
    }
    
    func delete(_ quote: Quote) {
        realm.delete(quote)
    }
    // MARK: - Private method
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print(error)
        }
    }
}
