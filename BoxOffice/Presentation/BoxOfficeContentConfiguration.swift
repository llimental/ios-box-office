//
//  BoxOfficeContentConfiguration.swift
//  BoxOffice
//
//  Created by Jason on 2023/05/03.
//

import UIKit

struct BoxOfficeContentConfiguration: UIContentConfiguration, Hashable {
    var movieName: String?
    var audienceCount: String?
    var rank: String?
    var rankVariation: String?
    var rankVariationColor: UIColor?
    var rankEmoji: UIImage?
    
    func makeContentView() -> UIView & UIContentView {
        return BoxOfficeContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> BoxOfficeContentConfiguration {
        
        guard let state = state as? UICellConfigurationState else {
            return self
        }
        
        var updatedConfiguration = self
        if state.isSelected {
            //TODO: - Second VC로 넘어가야하는 로직?
        } else {
            updatedConfiguration.movieName = "스즈메의 문단속"
            updatedConfiguration.audienceCount = "총 100만명 / 오늘 10명"
            updatedConfiguration.rank = "100"
            updatedConfiguration.rankEmoji = UIImage(systemName: "star.fill")
            updatedConfiguration.rankVariation = "10"
//            updatedConfiguration.rankVariationColor = .red
        }
        return updatedConfiguration
    }
}


