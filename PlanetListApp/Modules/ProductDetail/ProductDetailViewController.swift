//
//  ProductDetailViewController.swift
//  MLSearchApp
//
//  Created by David Figueroa on 13/04/21.
//

import SwiftUI

struct ProductDetailViewControllerUI: UIViewControllerRepresentable {
    
    var planet: Planet?
    
    init(planet: Planet?) {
        self.planet = planet
    }
    
    func makeUIViewController(context: Context) -> ProductDetailViewController {
        let viewController = ProductDetailViewController()
        viewController.planet = self.planet
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ProductDetailViewController, context: Context) {}
    
    typealias UIViewControllerType = ProductDetailViewController
}

class ProductDetailViewController: UIViewController {
    
    @IBOutlet private weak var articleImage: UIImageView?
    @IBOutlet private weak var priceLabel: UILabel?
    @IBOutlet private weak var installmentsLabel: UILabel?
    @IBOutlet private weak var featuresLabel: UILabel?
    @IBOutlet private weak var featuresTextView: UITextView?
    @IBOutlet private weak var descriptioLabel: UILabel?
    @IBOutlet private weak var descriptionTextView: UITextView?
    
    var planet: Planet?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {}
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
