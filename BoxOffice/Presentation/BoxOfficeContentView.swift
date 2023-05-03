//
//  BoxOfficeContentView.swift
//  BoxOffice
//
//  Created by Jason on 2023/05/03.
//

import UIKit

class BoxOfficeContentView: UIView, UIContentView {
    
    let boxOfficeBrief = BoxOfficeBrief()
    let boxOfficeRank = BoxOfficeRank()
    
    private var currentConfiguration: BoxOfficeContentConfiguration!
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        }
        set {
            guard let newConfiguration = newValue as? BoxOfficeContentConfiguration else {
                return
            }
            
            apply(configuration: newConfiguration)
        }
    }
    
    init(configuration: BoxOfficeContentConfiguration) {
        super.init(frame: .zero)
        setUpAllUIComponents()
        apply(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BoxOfficeContentView {
    
    private func setUpAllUIComponents() {
        
        let contentStackView = UIStackView()
        contentStackView.axis = .horizontal
        contentStackView.alignment = .leading
        contentStackView.distribution = .fill
        
        addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])
        
        contentStackView.addArrangedSubview(boxOfficeRank)
        contentStackView.addArrangedSubview(boxOfficeBrief)
    }
    
    private func apply(configuration: BoxOfficeContentConfiguration) {
        
        guard currentConfiguration != configuration else {
            return
        }
        
        currentConfiguration = configuration
        
        //MARK: - Set UI Components attributes
        boxOfficeRank.setRank(by: configuration.rank!)
        boxOfficeRank.setRankVariation(by: configuration.rankEmoji!)
        boxOfficeRank.setRankVariation(by: configuration.rankVariation!)
//        boxOfficeRank.setRankVaritaion(by: configuration.rankVariationColor!)

        boxOfficeBrief.setMovieName(by: configuration.movieName!)
        boxOfficeBrief.setAudienceCount(by: configuration.audienceCount!)
    }
}
