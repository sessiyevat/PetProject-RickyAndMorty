//
//  MainViewController.swift
//  RickyAndMortyApp
//
//  Created by Tommy on 5/1/23.
//

import UIKit

class MainViewController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
//        navigationController?.isNavigationBarHidden = false
        self.setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeHeightOfTabbar()
    }
    
    private func setUpViews(){
        let vc1 = CharactersAssembly.createModel()
        
        let episodesRouter = EpisodesRouter.start()
        let vc2 = episodesRouter.entry
        
        let vc3 = LocationsViewController()

        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        vc1.navigationItem.titleView = imageView
        
        UITabBar.appearance().backgroundColor = UIColor(named: "main")
        tabBar.tintColor = UIColor(named: "yellow")
        tabBar.isTranslucent = false

        changeRadiusOfTabbar()
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2 ?? UIViewController())
        let nav3 = UINavigationController(rootViewController: vc3)
        
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
