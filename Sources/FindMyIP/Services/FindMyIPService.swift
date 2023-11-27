//
//  FindMyIPService.swift
//  FindMyIP
//
//  Created by Zane on 11/22/23.
//

import Foundation
import Combine
import Alamofire

protocol FindMyIPServiceProtocol {
    func fetchData() -> AnyPublisher<AddressData?, AFError>
}

struct FindMyIPService: FindMyIPServiceProtocol {
    let endpoint: String = "https://ipapi.co/json/"
    
    func fetchData() -> AnyPublisher<AddressData?, AFError> {
        guard let url = URL(string: endpoint) else {
            return Fail(error: AFError.invalidURL(url: endpoint)).eraseToAnyPublisher()
        }
        
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: AddressData?.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
