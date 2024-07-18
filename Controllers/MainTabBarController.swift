//
//  MainTabBarController.swift
//  quakealert
//
//  Created by EMTECH MAC on 03/07/2024.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    let configuration = UIImage.SymbolConfiguration(weight: .heavy)
    let earthquakeViewModel = EarthquakeViewModel(apiManager: APIManager())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    func setupTabs() {
        viewControllers = [
            createMapNavigationController(),
            createSearchNavigationController(earthquakeViewModel: earthquakeViewModel)
        ]
    }

    func createMapNavigationController() -> UIViewController {
        // Use an example or default earthquake if necessary
        _ = Earthquake(id: "1", mag: 5.0, place: "Example", time: Int64(Date().timeIntervalSince1970), latitude: 0.0, longitude: 0.0)
        let mapVC = MapViewController()
        mapVC.tabBarItem.title = "Maps"
        mapVC.tabBarItem.image = UIImage(systemName: "map.circle", withConfiguration: configuration)
        mapVC.tabBarItem.selectedImage = UIImage(systemName: "map.circle.fill", withConfiguration: configuration)
        
        let navController = UINavigationController(rootViewController: mapVC)
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationItem.title = "Maps"
        
        return navController
    }

    func createSearchNavigationController(earthquakeViewModel: EarthquakeViewModel) -> UIViewController {
        let searchVC = SearchViewController(viewModel: earthquakeViewModel)
        searchVC.tabBarItem.title = "Search"
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle", withConfiguration: configuration)
        searchVC.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill", withConfiguration: configuration)
        
        let navController = UINavigationController(rootViewController: searchVC)
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationItem.title = "Search"
        
        return navController
    }
}
