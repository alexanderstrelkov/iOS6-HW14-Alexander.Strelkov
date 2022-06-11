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
        case secondAlbumBody
        case listBody
        case secondListBody
    }
    
    enum ElementKind: String, CaseIterable {
        case sectionHeader = "Мои альбомы"
        case secondSectionHeader = "Общие альбомы"
        case thirdSectionHeader = "Типы медиафайлов"
        case fourthSectionHeader = "Другое"
    }
    
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
        case .secondAlbumBody:
            return SecondAlbumsSection()
        case .listBody:
            return listSection()
        case .secondListBody:
            return secondListSection()
        }
    }
    
    private func albumsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets (top: 2, leading: 10, bottom: 2, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        
        group.interItemSpacing = .fixed(40.0)
        
        let rootGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(350))
        
        let rootGroup = NSCollectionLayoutGroup.horizontal(layoutSize: rootGroupSize, subitem: group, count: 2)
        
        rootGroup.interItemSpacing = .fixed(8.0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AlbumsHeader.identifier, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: rootGroup)
        
        section.boundarySupplementaryItems = [sectionHeader]
        
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func SecondAlbumsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets (top: 2, leading: 10, bottom: 2, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(175))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        group.contentInsets = .init(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
        
        group.interItemSpacing = .fixed(8.0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AlbumsHeader.identifier, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.boundarySupplementaryItems = [sectionHeader]
        
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
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AlbumsHeader.identifier, alignment: .top)
        
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func secondListSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(44))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AlbumsHeader.identifier, alignment: .top)
        
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    
    private lazy var photoRange: ClosedRange<Int> = 1...photoCells.count
    private lazy var secondPhotoRange: ClosedRange<Int> = (photoRange.upperBound + 1)...(photoRange.upperBound + secondPhotoCells.count)
    private lazy var listRange: ClosedRange<Int> = (secondPhotoRange.upperBound + 1)...(secondPhotoRange.upperBound + listCells.count)
    private lazy var secondListRange: ClosedRange<Int> = (listRange.upperBound + 1)...(listRange.upperBound + secondListCells.count)
    
    private var photoCells: [Album] = Album.itemsForCells()
    private var secondPhotoCells: [SecondAlbum] = SecondAlbum.itemsForCells()
    private var listCells: [List] = List.itemsForCells()
    private var secondListCells: [SecondList] = SecondList.itemsForCells()
    
    func configureDataSource() {
        
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: photoCollectionView) { [self]
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            
            dataSource.supplementaryViewProvider = { (
                collectionView: UICollectionView,
                kind: String,
                indexPath: IndexPath) -> UICollectionReusableView? in
                
                guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: AlbumsHeader.identifier,
                    for: indexPath) as? AlbumsHeader else { fatalError("Cannot create header view") }
                
                supplementaryView.label.text = ElementKind.allCases[indexPath.section].rawValue
                return supplementaryView
            }
            
            if self.photoRange ~= identifier {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { fatalError("Cannot create the cell") }
                let photoCells = self.photoCells[indexPath.row]
                cell.configureCell(titleText: photoCells.title, subtitleText: photoCells.subtitle, image: photoCells.image)
                return cell
            }
            
            if self.secondPhotoRange ~= identifier {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.identifier, for: indexPath) as? SecondCollectionViewCell else { fatalError("Cannot create the cell") }
                let secondPhotoCells = self.secondPhotoCells[indexPath.row]
                cell.configureCell(titleText: secondPhotoCells.title, subtitleText: secondPhotoCells.subtitle, image: secondPhotoCells.image)
                return cell
            }
            
            if self.listRange ~= identifier {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell else { fatalError("Cannot create the cell") }
                let listCells = self.listCells[indexPath.row]
                cell.configureCell(titleText: listCells.title, detailText: listCells.detail, image: listCells.image)
                return cell
            }
            
            if self.secondListRange ~= identifier {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondListCollectionViewCell.identifier, for: indexPath) as? SecondListCollectionViewCell else { fatalError("Cannot create the cell") }
                let secondListCells = self.secondListCells[indexPath.row]
                cell.configureCell(titleText: secondListCells.title, detailText: secondListCells.detail, image: secondListCells.image)
                return cell
            }
            fatalError("Cannot create the cell")
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        let sections: [Section] = [.albumBody, .secondAlbumBody, .listBody, .secondListBody]
        snapshot.appendSections([sections[0]])
        snapshot.appendItems(Array(photoRange))
        snapshot.appendSections([sections[1]])
        snapshot.appendItems(Array(secondPhotoRange))
        snapshot.appendSections([sections[2]])
        snapshot.appendItems(Array(listRange))
        snapshot.appendSections([sections[3]])
        snapshot.appendItems(Array(secondListRange))
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
        collectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.identifier)
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        collectionView.register(SecondListCollectionViewCell.self, forCellWithReuseIdentifier: SecondListCollectionViewCell.identifier)
        collectionView.register(AlbumsHeader.self, forSupplementaryViewOfKind: AlbumsHeader.identifier, withReuseIdentifier: AlbumsHeader.identifier)
        photoCollectionView = collectionView
    }
}


