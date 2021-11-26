//
//  ProductDetailViewController.swift
//  MLSearchApp
//
//  Created by David Figueroa on 13/04/21.
//

import SwiftUI

struct ProductDetailViewControllerUI: UIViewControllerRepresentable {
    
    var article: Article?
    
    init(article: Article?) {
        self.article = article
    }
    
    func makeUIViewController(context: Context) -> ProductDetailViewController {
        let viewController = ProductDetailViewController()
        viewController.article = self.article
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
    
    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        articleImage?.kf.setImage(with: URL(string: article?.thumbnail ?? ""))
        priceLabel?.text = "$\(article?.price ?? 0)"
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
