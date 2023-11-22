//
//  FindMyIPViewModel.swift
//  FindMyIP
//
//  Created by Zane on 11/22/23.
//

import Foundation
import Combine

public extension FindMyIPViewModel {
    enum State {
        case idle
        case loading
        case loaded
        case error
    }
}

public class FindMyIPViewModel: ObservableObject {
    private let service: FindMyIPServiceProtocol
    private var subscriptions: Set<AnyCancellable> = []
    @Published var addressData: AddressData?
    @Published var state: State = .idle
    @Published var errorMessage: String?


    init(service: FindMyIPServiceProtocol = FindMyIPService()) {
        self.service = service
        setupSubscriptions()
    }

    func getDataButtonTapped() {
        state = .loading
        print("fetching data...")
        service.fetchData()
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.state = .error
                    if let errorDescription = error.errorDescription {
                        self.errorMessage = errorDescription
                        print("Failed: " + errorDescription)
                    }
                case .finished:
                    break
                }
            } receiveValue: { [weak self] addressData in
                guard let self = self else { return }
                // update state
                self.addressData = addressData
            }
            .store(in: &subscriptions)
    }

    func setupSubscriptions() {
        $addressData
            .sink { [weak self] addressData in
                if addressData != nil {
                    self?.state = .loaded
                }
            }
            .store(in: &subscriptions)
    }
}
