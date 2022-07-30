//
//  AlbumViewController.swift
//  collectionPhoto
//
//  Created by Роман Назаров on 30.07.2022.
//

import UIKit

var myAlbums = [Albums]()
var peopleAndPlacesAlbums = [Albums]()
var mediaTypes = [Albums]()
var other = [Albums]()
var album: Albums?

class AlbumsViewController: UIViewController, UICollectionViewDelegate {
    
    static let sectionHeaderName = "section header name"
    
    var albumsCollectionView: UICollectionView! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        appendItems()
        configureCollectionView()
        configureDataSource()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.reuseIdentifer)
        collectionView.register(OtherCell.self, forCellWithReuseIdentifier: OtherCell.reuseIdentifer)
        collectionView.delegate = self
        collectionView.register(
            HeaderView.self,
            forSupplementaryViewOfKind: AlbumsViewController.sectionHeaderName,
            withReuseIdentifier: HeaderView.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        albumsCollectionView = collectionView
    }
    
    //MARK: - CollectionView DataSource
    var dataSource: UICollectionViewDiffableDataSource<Sections, Albums>! = nil
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource
        <Sections, Albums>(collectionView: albumsCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, albumItem: Albums) -> UICollectionViewListCell? in
            let sectionType = Sections.allCases[indexPath.section]
            switch sectionType {
            case .myAlbums:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseIdentifer, for: indexPath) as! AlbumCell
                cell.titleLabel.text = myAlbums[indexPath.row].name
                cell.itemsCountLabel.text = String(myAlbums[indexPath.row].album.count)
                cell.foregroundView.image = myAlbums[indexPath.row].album.last?.image
                return cell
            case .peopleAndPlacesAlbums:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseIdentifer, for: indexPath) as! AlbumCell
                cell.titleLabel.text = peopleAndPlacesAlbums[indexPath.row].name
                cell.itemsCountLabel.text = String(peopleAndPlacesAlbums[indexPath.row].album.count)
                cell.foregroundView.image = peopleAndPlacesAlbums[indexPath.row].album.last?.image
                return cell
            case .mediaTypes:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherCell.reuseIdentifer, for: indexPath) as! OtherCell
                cell.nameLabel.text = mediaTypes[indexPath.row].name
                cell.imageView.image = mediaTypes[indexPath.row].icon
                return cell
            case .other:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherCell.reuseIdentifer, for: indexPath) as! OtherCell
                cell.nameLabel.text = other[indexPath.row].name
                cell.imageView.image = other[indexPath.row].icon
                return cell
                
            }
        }
        
        dataSource.supplementaryViewProvider = { (
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.reuseIdentifier,
                for: indexPath) as? HeaderView else { fatalError("Cannot create header view") }
            
            supplementaryView.label.text = Sections.allCases[indexPath.section].rawValue
            return supplementaryView
        }
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot)
    }
    
    func snapshotForCurrentState() -> NSDiffableDataSourceSnapshot<Sections, Albums> {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Albums>()
        snapshot.appendSections([Sections.myAlbums])
        snapshot.appendItems(myAlbums)
        snapshot.appendSections([Sections.peopleAndPlacesAlbums])
        snapshot.appendItems(peopleAndPlacesAlbums)
        snapshot.appendSections([Sections.mediaTypes])
        snapshot.appendItems(mediaTypes)
        snapshot.appendSections([Sections.other])
        snapshot.appendItems(other)
        return snapshot
    }
    
    let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AlbumsViewController.sectionHeaderName,
            alignment: .top)
        
        let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    //    MARK: - Custom Layouts
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(44))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: AlbumsViewController.sectionHeaderName,
                alignment: .top)
            let section = NSCollectionLayoutSection.list(using: configuration, layoutEnvironment: layoutEnvironment)
            section.boundarySupplementaryItems = [sectionHeader]
            
            let sectionLayout = Sections.allCases[sectionIndex]
            switch (sectionLayout) {
            case .myAlbums: return self.configureMyAlbumsLayout()
            case .peopleAndPlacesAlbums: return self.configurePeopleAndPlacesAlbumsLayout()
            case.mediaTypes: return section
            case .other: return section
            }
        }
        return layout
    }
    
    
    func configureMyAlbumsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(200),
            heightDimension: .absolute(450))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AlbumsViewController.sectionHeaderName,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func configurePeopleAndPlacesAlbumsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(200),
            heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AlbumsViewController.sectionHeaderName,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    func configureMediaTypesLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(view.frame.width),
            heightDimension: .absolute(300))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 6)
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: AlbumsViewController.sectionHeaderName,
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
}

