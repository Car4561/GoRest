//
//  NetworkingService.swift
//  GoRest
//
//  Created by Carlos Alfredo Llerena Huayta on 13/07/22.
//

import Foundation
import GoRestNetworking

final class NetworkingService {
    
    let userDefaults = UserDefaults.standard

    var configuration: ClientConfiguration! {
        return makeConfiguration()
    }
    
    // MARK: Private methods
    
    private func makeConfiguration() -> ClientConfiguration {
        let configuration = ClientConfiguration(baseURL: makeHost(),
                                                httpHeaders: makeHeaders())
        
        return configuration
    }
    
    private func makeHost() -> String {
       return Host.baseUrl
    }
    
    private func makeHeaders() -> [String: String] {
        ["Content-Type" : "application/json"]
    }
}
