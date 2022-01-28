//
//  ViewModel.swift
//  Cats
//
//  Created by Арина  on 28.01.22.
//

import UIKit

class ViewModel {
    private var networkManager: NetworkManagerProtocol?
    public var loadImagesCompletion: ((Result<UIImage?, Error>) -> Void)?
    
    init() {
        self.networkManager = NetworkManager()
    }
    
    func loadImages() {
        networkManager?.loadImages { [weak self] result in
            self?.loadImagesCompletion?(result)
        }
    }
}
