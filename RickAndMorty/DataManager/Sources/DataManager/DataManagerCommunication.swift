//
//  File.swift
//  DataManager
//
//  Created by Roman on 22/02/2025.
//

import Foundation

internal protocol DataManagerCommunication {
    func fetchData<T: Decodable>(from url: String, as type: T.Type) async throws -> T
}
