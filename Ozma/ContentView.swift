//
//  ContentView.swift
//  Ozma
//
//  Created by Matin on 10/9/22.
//

import SwiftUI

@MainActor
class ViewModel: ObservableObject {

    @Published var pageInfo: String?

    private let service: HTMLServiceProtocol

    init(service: HTMLServiceProtocol) {
        self.service = service
    }

    func load() async {
        let page = await service.getPage()
        self.pageInfo = page
    }
}

struct ContentView: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Text(viewModel.pageInfo ?? "Loading...")
            .padding()
            .onAppear {
                Task { await viewModel.load() }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel(service: MockHTMLService()))
    }
}
