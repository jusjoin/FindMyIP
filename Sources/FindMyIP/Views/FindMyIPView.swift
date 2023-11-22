//
//  FindMyIPView.swift
//  FindMyIP
//
//  Created by Zane on 11/22/23.
//

import SwiftUI

public struct FindMyIPView: View {
    @ObservedObject var viewModel: FindMyIPViewModel = FindMyIPViewModel()
    
    public init() {
        
    }
    
    public var body: some View {
        VStack {
            headerView
            switch viewModel.state {
            case .idle: idleView
            case .loading: loadingView
            case .loaded: dataView
            case .error: errorView
            }
            Spacer()
            footerView
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 8)
    }

    var headerView: some View {
        Text("Find my IP!")
            .font(.title)
            .padding(.top, 12)
            .padding(.bottom, 32)
    }

    var footerView: some View {
        Button {
            viewModel.getDataButtonTapped()
        } label: {
            Text("Fetch my data!")
        }
        .padding(.bottom, 32)
    }
    var idleView: some View {
        Text("Tap button below to fetch your address data.")
    }

    var loadingView: some View {
        VStack {
            ProgressView("Data is being fetched")
                .scaleEffect(1.5)
        }
    }

    @ViewBuilder
    var dataView: some View {
        if let addressData = viewModel.addressData {
            ScrollView {
                VStack(alignment: .leading) {
                    ipView(addressData)
                    locationView(addressData)
                    localeView(addressData)
                    otherDetailsView(addressData)
                }
            }
        } else {
            EmptyView()
            // ErrorView?
        }
    }

    func ipView(_ addressData: AddressData) -> some View {
        VStack(alignment: .leading) {
            Text(addressData.ip)
            Text(addressData.network)
            Text(addressData.version)
        }
    }

    func locationView(_ addressData: AddressData) -> some View {
        VStack(alignment: .leading) {
            Text(addressData.city)
            Text(addressData.region)
            Text(addressData.regionCode)
            Text(addressData.country)
            Text(addressData.countryName)
            Text(addressData.countryCode)
            Text(addressData.countryCodeISO3)
            Text(addressData.countryCapital)
            Text(addressData.countryTLD)
            Text(addressData.countinentCode)
        }
    }

    func localeView(_ addressData: AddressData) -> some View {
        VStack(alignment: .leading) {
            Text(addressData.inEU ? "True" : "False")
            Text(addressData.postal)
            Text(String(addressData.latitude))
            Text(String(addressData.longitude))
            Text(addressData.timezone)
            Text(addressData.utcOffset)
            Text(addressData.countryCallingCode)
            Text(addressData.currency)
            Text(addressData.currencyName)
            Text(addressData.languages)
        }
    }

    func otherDetailsView(_ addressData: AddressData) -> some View {
        VStack(alignment: .leading) {
            Text(String(addressData.countryArea))
            Text(String(addressData.countryPopulation))
            Text(addressData.asn)
            Text(addressData.org)
        }
    }

    @ViewBuilder
    var errorView: some View {
        if let error = viewModel.errorMessage {
            Text(error)
        }
    }
}

struct FindMyIPView_Previews: PreviewProvider {
    static var previews: some View {
        FindMyIPView()
    }
}
