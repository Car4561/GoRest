//
//  ClientConfiguration.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

public typealias HTTPHeaders = [String: String]

public struct ClientConfiguration {
    
    let baseURL: String
    let httpHeaders: HTTPHeaders
    
    public init(baseURL: String, httpHeaders: HTTPHeaders) {
        self.baseURL = baseURL
        self.httpHeaders = httpHeaders
    }
}
