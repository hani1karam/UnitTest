//
//  DataProviderProtocol.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import Foundation
protocol DataProviderProtocol {
    func sentRequest<ResponseType: Codable> (request: RequestProtocol, mapResponseOnType: ResponseType.Type, successHandler: @escaping (ResponseType) -> Void, failureHandler: @escaping (Error) -> Void)
}
