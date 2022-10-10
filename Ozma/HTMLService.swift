//
//  HTMLService.swift
//  Ozma
//
//  Created by Matin on 10/10/22.
//

import Foundation
import Ozma_Data


protocol HTMLServiceProtocol {
    func getPage() async -> String
}

class HTMLService: HTMLServiceProtocol {
    func getPage() async -> String {
        do {
            return try await Greeting().getHtml()
        } catch {
            return "Error!, \(error)"
        }
    }
}

class MockHTMLService: HTMLServiceProtocol {
    func getPage() async -> String {
        "Hi"
    }
}
