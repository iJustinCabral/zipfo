//
//  ZipfoViewModel.swift
//  Zipfo
//
//  Created by Justin Cabral on 12/28/22.
//

import Foundation


protocol ViewModel: ObservableObject {}

extension ViewModel {
    func getZipInfo(postcode: String) async {}
}

@MainActor
final class ZipfoViewModel : ViewModel {
    
    enum State {
        case not_avilable
        case loading
        case success(data: ZipInformation)
        case failed(error: Error)
    }
    
    @Published private(set) var state: State = .not_avilable
    @Published var hasError: Bool = false
    
    private let service: Service
    
    init(service: Service) {
        self.service = service
        self.hasError = false
    }
    
    func getZipInfo(postcode: String) async {
        self.state = .loading
        self.hasError = false
        
        do {
            let zip = try await service.fetchZipInfo(postcode: postcode)
            self.state = .success(data: zip)
        } catch {
            self.state = .failed(error: error)
            self.hasError = true
            print(error)
        }
    }
    
    func resetState() {
        self.state = .not_avilable
    }
}
