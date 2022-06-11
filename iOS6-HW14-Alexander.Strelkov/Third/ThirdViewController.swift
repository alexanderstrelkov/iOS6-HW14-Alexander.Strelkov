//
//  ThirdViewController.swift
//  iOS6-HW14-Alexander.Strelkov
//
//  Created by Alexandr Strelkov on 07.06.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case albumBody
                        case listBody
    }
    
    var data = [Section]()
    
    //MARK: - Views
    
    var photoCollectionView: UICollectionView! = nil
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    
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
        config.interSectionSpacing = 30.0
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
        return layout
    }
    
    private func layoutSection(for section: Section, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch section {
        case .albumBody:
            return albumsSection()
        case .listBody:
            return listSection()
            
        }
    }
    
    private func albumsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets (top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(40.0)
        
        let rootGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(350))
        let rootGroup = NSCollectionLayoutGroup.horizontal(layoutSize: rootGroupSize, subitem: group, count: 2)
        rootGroup.interItemSpacing = .fixed(8.0)
        let section = NSCollectionLayoutSection(group: rootGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func listSection() -> NSCollectionLayoutSection {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
       return section
    }
    
    private lazy var photoRange: ClosedRange<Int> = 1...photoCells.count
    private lazy var listRange: ClosedRange<Int> = (photoRange.upperBound + 1)...(photoRange.upperBound + listCells.count)
    private var photoCells: [Album] = Album.itemsForCells()
    private var listCells: [List] = List.itemsForCells()
    
    
    func configureDataSource() {
        
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: photoCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            if self.photoRange ~= identifier {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError("Cannot create the cell") }
                let photoCells = self.photoCells[indexPath.row]
                cell.configureCell(titleText: photoCells.title, subtitleText: photoCells.subtitle, image: photoCells.image)
                
                return cell
            }
            
            if self.listRange ~= identifier {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell else { fatalError("Cannot create the cell") }
                let listCells = self.listCells[indexPath.row]
            
                cell.configureCell(titleText: listCells.title, detailText: listCells.detail, image: listCells.image)
                
                return cell
            }
            fatalError("Cannot create the cell")
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        let sections: [Section] = [.albumBody, .listBody]
        snapshot.appendSections([sections[0]])
        snapshot.appendItems(Array(photoRange))
        snapshot.appendSections([sections[1]])
        snapshot.appendItems(Array(listRange))
        self.dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

extension ThirdViewController {
    func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        photoCollectionView = collectionView
    }
}


