//
//  Resource.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

public protocol Resource {
    
    var resource: (method: HTTPMethod, route: String) { get }
}
