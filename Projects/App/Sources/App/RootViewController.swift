import Foundation
import UIKit
import uHome
import uSearch

class RootViewController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let search = SearchViewController()
        let home = HomeViewController()
        self.viewControllers = [search, home].map(UINavigationController.init)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
