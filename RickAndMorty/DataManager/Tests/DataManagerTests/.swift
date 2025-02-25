//
//  NetworkManagerTests.swift
//  DataManager
//
//  Created by Roman on 23/02/2025.
//

import SwiftUI
import Testing
@testable import DataManager

struct NetworkManagerTests {
    
    var networkManager: NetworkManager!
    var mockURLSession: MockURLSession!
    
    // Настройка перед каждым тестом
    init() {
        mockURLSession = MockURLSession()
        networkManager = NetworkManager(session: mockURLSession)
    }
    
    @Test func testFetchDataSuccess() async throws {
        let json = """
        {
            "id": 1,
            "name": "Test"
        }
        """
        let data = json.data(using: .utf8)
        let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // Настройка мока
        await mockURLSession.setData(data)
        await mockURLSession.setResponse(response)
        
        // Вызов метода
        let result: MockDecodable = try await networkManager.fetchData(from: "https://example.com", as: MockDecodable.self)
        
        // Проверка результата
        #expect(result.id == 1)
        #expect(result.name == "Test")
    }
    
    // Тест на ошибку invalidURL
    @Test func testFetchDataInvalidURL() async {
        await #expect(throws: NetworkError.invalidURL.self) {
            let _: MockDecodable = try await networkManager.fetchData(from: "invalid url", as: MockDecodable.self)
        }
    }
    
    // Тест на ошибку invalidResponse
    @Test func testFetchDataInvalidResponse() async {
        // Подготовка данных
        let json = """
        {
            "id": 1,
            "name": "Test"
        }
        """
        let data = json.data(using: .utf8)
        let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 404, httpVersion: nil, headerFields: nil)
        
        // Настройка мока
        await mockURLSession.setData(data)
        await mockURLSession.setResponse(response)
        
        // Вызов метода
        await #expect(throws: NetworkError.invalidResponse.self) {
            let _: MockDecodable = try await networkManager.fetchData(from: "https://example.com", as: MockDecodable.self)
        }
    }
    
    // Тест на ошибку invalidData
    @Test func testFetchDataInvalidData() async {
        // Подготовка данных (невалидный JSON)
        let json = """
        {
            "id": "invalid", // Ожидается Int, но передается String
            "name": "Test"
        }
        """
        let data = json.data(using: .utf8)
        let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // Настройка мока
        await mockURLSession.setData(data)
        await mockURLSession.setResponse(response)
        
        // Вызов метода
        await #expect(throws: NetworkError.invalidData.self) {
            let _: MockDecodable = try await networkManager.fetchData(from: "https://example.com", as: MockDecodable.self)
        }
    }
}

// Модель для тестирования
struct MockDecodable: Decodable, Sendable {
    let id: Int
    let name: String
}

// Ошибки для тестирования
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
