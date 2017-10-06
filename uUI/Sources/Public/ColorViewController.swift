import UIKit

open class ColorViewController: UIViewController {
    
    let color: UIColor
    
    public init(title: String, color: UIColor) {
        self.color = color
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func loadView() {
        super.loadView()
        view.backgroundColor = color
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.text = self.title
        label.textColor = .black
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        label.textAlignment = .center
    }
}
