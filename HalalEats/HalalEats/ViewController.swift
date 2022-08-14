//
//  ViewController.swift
//  HalalEats
//
//  Created by Majd Khadra on 8/13/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var mapView = MKMapView()
    var searchBar = UISearchBar()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        view.addSubview(searchBar)
        view.addSubview(mapView)
        view.backgroundColor = UIColor.white
        mapView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraint(NSLayoutConstraint(item: searchBar, attribute: .bottom, relatedBy: .equal, toItem: mapView, attribute: .top, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: searchBar, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: searchBar, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0))
        
        self.view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0))
        

    }
    
    override func viewDidLayoutSubviews() {
        self.view.addConstraint(NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: self.view.safeAreaInsets.top))
        

    }
}

// MARK: UISearchBarDelegate
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text
        networkManager.request(endpoint: HEEndpoint.getSearchResults(searchText: searchText!)) { (result: Result <Data, Error>) in
            switch result {
            case .success(let response):
                print("Response: \(response)")
            case .failure(let failure):
                print("failed")
            }
        }
    }
}
