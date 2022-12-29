//
//  ZipfoService.swift
//  Zipfo
//
//  Created by Justin Cabral on 12/28/22.
//

import Foundation

protocol Service {
    func fetchZipInfo(postcode: String) async throws -> ZipInformation
}


final class ZipfoService: Service {
    func fetchZipInfo(postcode: String) async throws -> ZipInformation {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseURL.appending(postcode))
        let (data, _) = try await urlSession.data(from: url!)
        
        return try JSONDecoder().decode(ZipInformation.self, from: data)
    }
}
