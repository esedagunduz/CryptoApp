//
//  NetworkManager.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 8.12.2025.
//

import Foundation
import Combine

class NetworkManager{
    enum NetworkingError:LocalizedError{
        case badUrlResponse(url:URL)
        case unknown
        
        var errorDescription: String?{
            switch self{
            case .badUrlResponse(url:let url):
                return "Bad url response"
            case .unknown:
                return "Unknown error occured"
            }
        }
        
    }
    
    static func download(url:URL)->AnyPublisher<Data,Error>{
        return  URLSession.shared.dataTaskPublisher(for: url)
            .tryMap ({ try handleResponse(output: $0,url:url)})
            .retry(3)
            .eraseToAnyPublisher()
    }
    static func handleCompletion(completion: Subscribers.Completion<any Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
            
        }
    }
    
    static func handleResponse(output:URLSession.DataTaskPublisher.Output,url:URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode<300 else {
            throw NetworkingError.badUrlResponse(url:url)
        }
        
        return output.data
        
        
    }
}
