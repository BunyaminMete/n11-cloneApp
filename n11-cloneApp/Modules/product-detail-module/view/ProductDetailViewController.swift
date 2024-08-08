import UIKit

import UIKit

class ProductDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private var productDetailCollectionView: UICollectionView!
    
    let bottomView = UIView()
    private let backToRootButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
    var product: ProductCardCellModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        if let product = product {
            print(product)
        }
        
        bottomView.backgroundColor = .gray
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        buildCollectionView()
        setCompositionalLayout()
        setupBackToRootButton()

    }
    
    private func setupBackToRootButton() {
            view.addSubview(backToRootButton)

            // Button constraints
            NSLayoutConstraint.activate([
                backToRootButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                backToRootButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                backToRootButton.widthAnchor.constraint(equalToConstant: 44),
                backToRootButton.heightAnchor.constraint(equalToConstant: 44)
            ])

            backToRootButton.addTarget(self, action: #selector(returnToRoot), for: .touchUpInside)
        }
    
    private func buildCollectionView() {
        productDetailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        productDetailCollectionView.backgroundColor = .white
        productDetailCollectionView.delegate = self
        productDetailCollectionView.dataSource = self
        
        productDetailCollectionView.register(cellClass: ProductDetailImageCollectionViewCell.self)
        productDetailCollectionView.register(cellClass: ProductDetailMiniFeaturesCollectionViewCell.self)
        
        view.addSubview(productDetailCollectionView)
        productDetailCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productDetailCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            productDetailCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productDetailCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productDetailCollectionView.bottomAnchor.constraint(equalTo: bottomView.topAnchor)
        ])
    }
    
    private func setCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            return self.layoutSection(for: sectionIndex)
        }
        productDetailCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func layoutSection(for section: Int) -> NSCollectionLayoutSection {
        switch section {
        case 0:
            return CompositionalLayoutProductDetailManager.sharedInstance.createTopProductImageLayout()
        case 1:
            return CompositionalLayoutProductDetailManager.sharedInstance.createMiniProductFeaturesViewLayout()
        default:
            fatalError("Unhandled cell type")
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // Toplam section sayısı
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5 // İlk section için item sayısı
        case 1:
            return 1 // İkinci section için item sayısı
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailImageCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductDetailImageCollectionViewCell
            cell.productDetailImageView.image = UIImage(named: product?.productImage ?? "")
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailMiniFeaturesCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductDetailMiniFeaturesCollectionViewCell
            cell.topLabel.text = product?.productTitle
            // Burada bubble cell'i özelleştir
            return cell
        default:
            fatalError("Unhandled section")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    @objc private func returnToRoot() {
        navigationController?.popViewController(animated: true)
    }
    
    
}


extension ProductDetailViewController: ProductDetailImageCollectionViewCellDelegate {
    func didTapBackToRootButton(in cell: ProductDetailImageCollectionViewCell) {
            // Navigation Controller ile dismiss işlemi
            print("tıklandı")
            navigationController?.popViewController(animated: true)
        }
}

