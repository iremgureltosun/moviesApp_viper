//
//  ParserService.swift
//  InvioAPI
//
//  Created by irem TOSUN on 4.06.2022.
//

import Foundation
import Combine
import os.log

protocol ParserServiceProtocol {
    func assignDelegate(listener: ParserListenerDelegate)
    func getMovies(by title: String)
}
protocol ParserListenerDelegate{
    func didReceiveResult(list: [Movie]?, error: Error?)
}
class ParserService: ParserServiceProtocol {
    var searchService: MovieSearchServiceProtocol!
    var searchCancellable: AnyCancellable?
    var listener: ParserListenerDelegate?
    
    init(searchService: MovieSearchServiceProtocol) {
        self.searchService = searchService
    }
    func assignDelegate(listener: ParserListenerDelegate){
        self.listener = listener
    }
    
    func getMovies(by title: String) {
        var list = [Movie]()
        let queue = DispatchQueue.main
        searchCancellable = searchService.search(by: title)
            .receive(on: queue)
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    self.listener?.didReceiveResult(list: nil, error: error)
                case .finished:
                    let count = list.count
                    print("All good found \(count) results")
                    self.listener?.didReceiveResult(list: list, error: nil)
                }

            }, receiveValue: { data in
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let movie = try decoder.decode(Movie.self, from: data)
                    list.append(movie)
                    os_log("Success: %s", log: Log.network, type: .default, "Loaded")
                } catch {
                    let errorMessage = "\(error.localizedDescription)"
                    os_log("Error: %s", log: Log.data, type: .error, errorMessage)
                }
            })
    }
}
