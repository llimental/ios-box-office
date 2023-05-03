//
//  BoxOfficeListCell.swift
//  BoxOffice
//
//  Created by 이상윤 on 2023/05/02.
//

import UIKit

class BoxOfficeListCell: UICollectionViewListCell {

    static let identifier = String(describing: BoxOfficeListCell.self)
    
    var dailyBoxOffice: DailyBoxOffice?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        
        // UICollectionViewListCell Window를 확인해보면
        // --- UIBackgroundConfiguration
        // --- UIContentConfiguration
        // 2가지로 구성되어 있음
        
        var newBackgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        newBackgroundConfiguration.backgroundColor = .lightGray
        backgroundConfiguration = newBackgroundConfiguration
        
        var newConfiguration = BoxOfficeContentConfiguration().updated(for: state)
        newConfiguration.movieName = dailyBoxOffice?.movieBrief.movieName
        newConfiguration.audienceCount = dailyBoxOffice?.movieBrief.audienceCount
        
        newConfiguration.rankVariation = dailyBoxOffice?.rank.rank
//        newConfiguration.rankVariationColor = dailyBoxOffice?.rank.movieType
        newConfiguration.rankEmoji = dailyBoxOffice?.rankEmoji
        
        contentConfiguration = newConfiguration
    }
}
