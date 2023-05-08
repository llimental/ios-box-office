//
//  HomeViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

private enum Section: CaseIterable {
    case main
}

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureOfMainViewLayout()
        makeDataSource()
    }
    
    let navigationBar : UINavigationBar = {
        let navigationBar = UINavigationBar()
        let navigationItem = UINavigationItem(title: "2023-05-01")
        navigationBar.setItems([navigationItem], animated: true)
        
        return navigationBar
    }()
    
    //MARK: - Private Property
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.bounds,
                                              collectionViewLayout: configureOfCollectionViewLayout())
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.clipsToBounds = true
        
        return collectionView
    }()
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, DailyBoxOffice>!
    
    //MARK: - Configure of Layout
    private func configureOfMainViewLayout() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        self.view.addSubview(navigationBar)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: safeArea.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBar.layoutMarginsGuide.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func configureOfCollectionViewLayout() -> UICollectionViewLayout {
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: layoutConfig)
    }
    
    //MARK: - Cell Register of DiffableDataSource
    private func makeDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<BoxOfficeListCell, DailyBoxOffice> { (cell, indexPath, dailyBoxOffice) in
            cell.dailyBoxOffice = dailyBoxOffice
            cell.accessories = [.disclosureIndicator()]
        }
        
        self.dataSource = UICollectionViewDiffableDataSource<Section, DailyBoxOffice>(collectionView: self.collectionView) { (collectionView, indexPath, dailyBoxOffice) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                for: indexPath,
                                                                item: dailyBoxOffice)
        }
        
        let snapshot = initialSnapshot()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    //MARK: - Snapshot
    private func initialSnapshot() -> NSDiffableDataSourceSnapshot<Section, DailyBoxOffice> {
        let test = [
            DailyBoxOffice(rankEmoji: UIImage(systemName: "arrowtriangle.up.fill")!,
                           movieBrief: MovieBrief(movieName: "스즈메", audienceCount: "이건 snapshot 내용이다."),
                           rank: Rank(rank: "100", movieType: "40")),
            
            DailyBoxOffice(rankEmoji: UIImage(systemName: "arrowtriangle.up.fill")!,
                           movieBrief: MovieBrief(movieName: "야사시", audienceCount: "스키"),
                           rank: Rank(rank: "101", movieType: "50")),
            
            DailyBoxOffice(rankEmoji: UIImage(systemName: "arrowtriangle.up.fill")!,
                           movieBrief: MovieBrief(movieName: "아리가또", audienceCount: "스즈메짱"),
                           rank: Rank(rank: "102", movieType: "60"))
        ]
        var snapshot = NSDiffableDataSourceSnapshot<Section, DailyBoxOffice>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(test, toSection: .main)
        return snapshot
    }
}
