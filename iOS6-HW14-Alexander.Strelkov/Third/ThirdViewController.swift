//
//  ThirdViewController.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 07.06.2022.
//

import UIKit

struct Section {
    let options: [CollectionViewType]
}
enum CollectionViewType {
    case imageCell(model: CustomData)
    
}
struct CustomData {
    var image: UIImage?
}

class ThirdViewController: UIViewController {
    
    var data = [Section]()
    
    //MARK: - Views
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        return collection
    }()
    
    private var plusButton: UIButton = {
        var button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        view.backgroundColor = .white
        configCells()
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - Initial
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - Settings
    
    private func setupHierarchy() {
//        view.addSubview(albumLabel)
        view.addSubview(collectionView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
    private func setupLayout() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
 
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, constant: 40).isActive = true
    }
    
    //MARK: - Functions
    
    func configCells() {
        data.append(Section(options: [
            .imageCell(model: CustomData(image: UIImage(named: "image0"))),
            .imageCell(model: CustomData(image: UIImage(named: "image1"))),
            .imageCell(model: CustomData(image: UIImage(named: "image2"))),
            .imageCell(model: CustomData(image: UIImage(named: "image3"))),
            .imageCell(model: CustomData(image: UIImage(named: "image4"))),
            .imageCell(model: CustomData(image: UIImage(named: "image5"))),
            .imageCell(model: CustomData(image: UIImage(named: "image6"))),
            .imageCell(model: CustomData(image: UIImage(named: "image7"))),
        ]))
    }
}

extension ThirdViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = data[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .imageCell(let model):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CustomCollectionViewCell.identifier,
                for: indexPath) as? CustomCollectionViewCell else {
                    return UICollectionViewCell()
                }
            cell.configureCell(with: model)
            return cell
        }
    }
}
