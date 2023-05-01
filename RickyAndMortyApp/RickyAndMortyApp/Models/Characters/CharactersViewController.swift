//
//  CharactersViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit

class CharactersViewController: UITabBarController, CharactersViewProtocol{

    var presenter: CharactersPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .systemBackground
        setUpViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeHeightOfTabbar()
    }
    
    private func setUpViews(){
        let vc1 = MainViewController()
        let vc2 = EpisodesViewController()
        let vc3 = LocationsViewController()
        
//        vc1.title = "Magnum Go"
//        vc2.title = "My Cart"
//        vc3.title = "Profile"
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        vc1.navigationItem.titleView = imageView
        
        UITabBar.appearance().backgroundColor = UIColor(named: "main")
//        tabBar.backgroundColor = UIColor(named: "main")
        tabBar.tintColor = UIColor(named: "yellow")
        tabBar.isTranslucent = false

        changeRadiusOfTabbar()
        
//        vc1.navigationItem.largeTitleDisplayMode = .always
//        vc2.navigationItem.largeTitleDisplayMode = .always
//        vc3.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
//        nav1.navigationBar.tintColor = .label
//        nav2.navigationBar.tintColor = .label
//        nav3.navigationBar.tintColor = .label
        
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.circle"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "play.tv"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "mappin.circle"), tag: 1)

        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3], animated: false)
    }
    
    func changeHeightOfTabbar(){
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame            = tabBar.frame
            tabFrame.size.height    = 90
            tabFrame.origin.y       = view.frame.size.height - 90
            tabBar.frame            = tabFrame
        }
    }
    
    func changeRadiusOfTabbar(){
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
