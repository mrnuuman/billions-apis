//
//  URLSessionRequestBuilderFactory.swift
//  
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public class URLSessionRequestBuilderFactory: RequestBuilderFactory {
    public func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type {
        return RequestBuilder<T>.self
    }

    public func getBuilder<T: Decodable>() -> RequestBuilder<T>.Type {
        return RequestBuilder<T>.self
    }
}

public protocol RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type
    func getBuilder<T: Decodable>() -> RequestBuilder<T>.Type
}
