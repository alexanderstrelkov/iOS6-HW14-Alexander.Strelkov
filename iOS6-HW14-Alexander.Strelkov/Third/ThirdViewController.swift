//
//  ThirdViewController.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 07.06.2022.
//

import UIKit

//struct Section {
//    let options: [CollectionViewType]
//}
//
//enum CollectionViewType {
//    case imageCell(model: CustomData)
//}

//struct CustomData {
//    var image: UIImage
//}

class ThirdViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case albumBody

    }
    
    var data = [Section]()
    
    var image0 = UIImage(named: "image0")
    var image1 = UIImage(named: "image1")
    var image2 = UIImage(named: "image2")
    var image3 = UIImage(named: "image3")
    var image4 = UIImage(named: "image4")
    var image5 = UIImage(named: "image5")
    var image6 = UIImage(named: "image6")
    var image7 = UIImage(named: "image7")
    var image8 = UIImage(named: "image8")
    var image9 = UIImage(named: "image9")
    var image10 = UIImage(named: "image10")
    var image11 = UIImage(named: "image11")
    
    
    //MARK: - Views
    
    var photoCollectionView: UICollectionView! = nil
    
    var dataSource: UICollectionViewDiffableDataSource<Section, CustomCellModel>! = nil
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        view.backgroundColor = .white
        configureCollectionView()
        configureDataSource()
    }
    
    
    
    //MARK: - Initial
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setupHierarchy()
        //        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
    //MARK: - Functions
    
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            let section = self.layoutSection(for: sectionKind, layoutEnvironment: layoutEnvironment)
            return section
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16.0
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
        return layout
    }
    
    private func layoutSection(for section: Section, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch section {
        case .albumBody:
            return albumsSection()
//        case .strokesBody:
//            return appsSection()
        }
    }
    
    private func albumsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets (top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(8.0)
        
        let rootGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(350))
        let rootGroup = NSCollectionLayoutGroup.horizontal(layoutSize: rootGroupSize, subitem: group, count: 2)
        rootGroup.interItemSpacing = .fixed(8.0)
        let section = NSCollectionLayoutSection(group: rootGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }

    private func itemsForCells() -> [CustomCellModel] {
        return [
            CustomCellModel(image0!),
            CustomCellModel(image1!),
            CustomCellModel(image2!),
            CustomCellModel(image3!),
            CustomCellModel(image4!),
            CustomCellModel(image5!),
            CustomCellModel(image6!),
            CustomCellModel(image7!),
            CustomCellModel(image8!),
            CustomCellModel(image9!),
            CustomCellModel(image10!),
            CustomCellModel(image11!)
        ]
    }
    
}

extension ThirdViewController {
    func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        photoCollectionView = collectionView
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, CustomCellModel>(
            collectionView: photoCollectionView) { (collectionView: UICollectionView, indexPath: IndexPath, customCell: CustomCellModel) -> UICollectionViewCell? in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
                    fatalError()
                }
                cell.imageView.image = customCell.image
                return cell
            }
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Section, CustomCellModel> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CustomCellModel>()
        snapshot.appendSections([Section.albumBody])
        let items = itemsForCells()
        snapshot.appendItems(items)
        return snapshot
    }
}
