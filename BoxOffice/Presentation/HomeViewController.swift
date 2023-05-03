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
        self.navigationItem.title = "2023-05-01"
        configureOfMainViewLayout()
        makeDataSource()
        performQuery()
    }
    
    //MARK: - Private Property
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.view.frame,
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
        
        self.view.backgroundColor = .systemGray2
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func configureOfCollectionViewLayout() -> UICollectionViewLayout {
        let layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: layoutConfig)
    }
    
    //MARK: - Cell Register of DiffableDataSource
    private func makeDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<BoxOfficeListCell, DailyBoxOffice> { (cell, indexPath, dailyBoxOffice) in
//            cell.setupAllUIComponents()
        }
        
        self.dataSource = UICollectionViewDiffableDataSource<Section, DailyBoxOffice>(collectionView: self.collectionView) { (collectionView, indexPath, dailyBoxOffice) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                for: indexPath,
                                                                item: dailyBoxOffice)
        }
    }
    
    //MARK: - Snapshot
    private func performQuery() {
        let test = [
            DailyBoxOffice(rankEmoji: UIImage(systemName: "arrowtriangle.up.fill")!,
                           movieBrief: MovieBrief(movieName: "스즈메", audienceCount: "이건 snapshot 내용이다."),
                           rank: Rank(rank: "100", movieType: "40")),
            DailyBoxOffice(rankEmoji: UIImage(systemName: "arrowtriangle.up.fill")!,
                           movieBrief: MovieBrief(movieName: "야사시", audienceCount: "스키"),
                           rank: Rank(rank: "101", movieType: "50"))
        ]
        var snapshot = NSDiffableDataSourceSnapshot<Section, DailyBoxOffice>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(test, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
