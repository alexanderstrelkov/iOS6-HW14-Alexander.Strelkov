//
//  ThirdViewController.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 07.06.2022.
//

import UIKit

struct CustomData {
    var image: UIImage
}

class ThirdViewController: UIViewController {
    
    let data = [
        CustomData(image: UIImage(named: "image0")!),
        CustomData(image: UIImage(named: "image1")!),
        CustomData(image: UIImage(named: "image2")!),
        CustomData(image: UIImage(named: "image3")!),
        CustomData(image: UIImage(named: "image4")!),
        CustomData(image: UIImage(named: "image5")!),
        CustomData(image: UIImage(named: "image6")!),
        CustomData(image: UIImage(named: "image7")!)
    ]
    
    //MARK: - Views
    
//    private var tableView: UITableView = {
//        let table = UITableView(frame: .zero, style: .insetGrouped)
//        table.backgroundColor = .gray
//        return table
//    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
       
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        return collection
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
//        view.addSubview(tableView)
        view.addSubview(collectionView)
        
    }
   
    private func setupLayout() {
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.frame = view.bounds
       
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, constant: 40).isActive = true
    }
    
    //MARK: - Functions
    
    
    
    
}

extension ThirdViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.data = self.data[indexPath.row]
        
        return cell
    }
    
}
