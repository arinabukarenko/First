//
//  ViewController.swift
//  Cats
//
//  Created by Арина  on 28.01.22.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel: ViewModel = ViewModel()

    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update photo", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let favoritesButton: UIButton = {
        let favButton = UIButton()
        favButton.setTitle("Add to favorites", for: .normal)
        favButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        favButton.backgroundColor = .black
        favButton.layer.cornerRadius = 15
        favButton.layer.borderColor = UIColor.yellow.cgColor
        favButton.layer.borderWidth = 5
        favButton.translatesAutoresizingMaskIntoConstraints = false
        return favButton
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        updateButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        
        bindModel()
    }
    
    func bindModel() {
        viewModel.loadImagesCompletion = { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.updateUI(isLoading: false)
                switch result {
                case .success(let image):
                    self.imageView.image = image
                case .failure(let error):
                    self.showError(with: error)
                }
            }
        }
    }
    
    func showPic(){
        loadImages()
    }
    
    @objc func presentButtonTapped() {
        imageView.image = nil
        showPic()
    }
    
    func loadImages(){
        updateUI(isLoading: true)
        viewModel.loadImages()
    }
    
    func updateUI(isLoading: Bool) {
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        updateButton.isEnabled = !isLoading
        
        
    }
    func showError(with error: Error) {
        let myAlert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
extension ViewController {
    
    func setup() {
        view.backgroundColor = .white
        title = "Коты"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
        
        view.addSubview(updateButton)
        NSLayoutConstraint.activate([
            updateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -20),
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            updateButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(favoritesButton)
        NSLayoutConstraint.activate([
            favoritesButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
//            favoritesButton.bottomAnchor.constraint(equalTo: updateButton.topAnchor, constant:  20),
            favoritesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favoritesButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            favoritesButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
}

