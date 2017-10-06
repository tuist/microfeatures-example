import Foundation
import uUI

public class HomeViewController: ColorViewController {
    
    public init() {
        super.init(title: "Home", color: .green)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
