//
//  OzmaApp.swift
//  Ozma
//
//  Created by Matin on 10/9/22.
//

import SwiftUI

@main
struct OzmaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel(service: HTMLService()))
        }
    }
}
