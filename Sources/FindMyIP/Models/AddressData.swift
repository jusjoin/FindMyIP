//
//  AddressData.swift
//  FindMyIP
//
//  Created by Zane on 11/22/23.
//

import Foundation

struct AddressData: Codable {
    let ip: String
    let network: String
    let version: String
    let city: String
    let region: String
    let regionCode: String
    let country: String
    let countryName: String
    let countryCode: String
    let countryCodeISO3: String
    let countryCapital: String
    let countryTLD: String
    let countinentCode: String
    let inEU: Bool
    let postal: String
    let latitude: Double
    let longitude: Double
    let timezone: String
    let utcOffset: String
    let countryCallingCode: String
    let currency: String
    let currencyName: String
    let languages: String
    let countryArea: Double
    let countryPopulation: Int
    let asn: String
    let org: String

    enum CodingKeys: String, CodingKey {
        case ip
        case network
        case version
        case city
        case region
        case regionCode = "region_code"
        case country
        case countryName = "country_name"
        case countryCode = "country_code"
        case countryCodeISO3 = "country_code_iso3"
        case countryCapital = "country_capital"
        case countryTLD = "country_tld"
        case countinentCode = "continent_code"
        case inEU = "in_eu"
        case postal
        case latitude
        case longitude
        case timezone
        case utcOffset = "utc_offset"
        case countryCallingCode = "country_calling_code"
        case currency
        case currencyName = "currency_name"
        case languages
        case countryArea = "country_area"
        case countryPopulation = "country_population"
        case asn
        case org
    }
}
