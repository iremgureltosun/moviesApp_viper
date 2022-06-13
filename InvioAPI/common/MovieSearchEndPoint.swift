//
//  MovieSearchEndPoint.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import Foundation

public enum MovieSearchEndpoint {
    case searchByTitle(title: String)
}

extension MovieSearchEndpoint {
    public var baseURL: URL {
        return URL(string: "\(Constants.Network.baseUrlPath)\(Constants.Network.apiKEY)")!
    }

    public var path: String {
        switch self {
        case let .searchByTitle(title):
            return Constants.Network.searchByTitlePath + "/\(title)/"
        }
    }

    public var method: String {
        return "GET"
    }

    public var sampleData: Data {
        return Data()
    }

    public var headers: [String: String]? {
        return nil
    }
}

extension MovieSearchEndpoint {
    public func searchByTitleURL() -> URL {
        let urlString = baseURL.absoluteString + path
        guard let url = URL(string: urlString) else {
            fatalError("Failed to create URL for endpoint: \(urlString)")
        }
        return url
    }

    public func searchByTitleURLRequest() -> URLRequest {
        let url = searchByTitleURL()
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        return request
    }
}

