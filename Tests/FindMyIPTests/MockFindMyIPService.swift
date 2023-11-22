//
//  MockFindMyIPService.swift
//  FindMyIPTests
//
//  Created by Zane on 11/22/23.
//

import Foundation
import Combine
import Alamofire
@testable import FindMyIP

class MockFindMyIPService: FindMyIPServiceProtocol {
    var isSuccess: Bool = true
    func fetchData() -> AnyPublisher<AddressData?, AFError> {
        if isSuccess {
            return Just(addressData)
                .setFailureType(to: AFError.self)
                .eraseToAnyPublisher()
        } else {
                return Fail(error: AFError.invalidURL(url: "endpoint"))
                .debounce(for: .seconds(2), scheduler: RunLoop.main)
                .eraseToAnyPublisher()
        }
    }

    var addressData = AddressData(ip: "",
                                  network: "",
                                  version: "",
                                  city: "",
                                  region: "",
                                  regionCode: "",
                                  country: "",
                                  countryName: "",
                                  countryCode: "",
                                  countryCodeISO3: "",
                                  countryCapital: "",
                                  countryTLD: "",
                                  countinentCode: "",
                                  inEU: false,
                                  postal: "",
                                  latitude: 0.0,
                                  longitude: 0.0,
                                  timezone: "",
                                  utcOffset: "",
                                  countryCallingCode: "",
                                  currency: "",
                                  currencyName: "",
                                  languages: "",
                                  countryArea: 0,
                                  countryPopulation: 0,
                                  asn: "",
                                  org: "")
}

