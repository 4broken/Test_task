//
//  HeroesTableViewCell.swift
//  Test_task
//
//  Created by Shamil Mazitov on 20.06.2022.
//

import Foundation
import UIKit

class TaxiTableViewCell: UITableViewCell {
    static let identifier = "TaxiTableViewCell"
    var taxiImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }()
    
     lazy var taxiEndAddress: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var taxiOrderTime: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var taxiPrice: UILabel = {
       let label = UILabel()
       label.font = UIFont.boldSystemFont(ofSize: 20)
       label.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    lazy var taxiStartAddress: UILabel = {
       let label = UILabel()
       label.font = UIFont.boldSystemFont(ofSize: 20)
       label.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    
    
    func setupConstraints() {
        let offset: CGFloat = 16
        var constraints = [NSLayoutConstraint]()
        constraints.append(taxiStartAddress.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: offset))
        constraints.append(taxiStartAddress.rightAnchor.constraint(equalTo: taxiStartAddress.rightAnchor))
        constraints.append(taxiStartAddress.topAnchor.constraint(equalTo: topAnchor,constant: 10))
        constraints.append(taxiStartAddress.bottomAnchor.constraint(equalTo: taxiStartAddress.bottomAnchor))
        
        constraints.append(taxiEndAddress.leftAnchor.constraint(equalTo: taxiStartAddress.leftAnchor))
        constraints.append(taxiEndAddress.rightAnchor.constraint(equalTo: taxiEndAddress.rightAnchor))
        constraints.append(taxiEndAddress.bottomAnchor.constraint(equalTo: taxiEndAddress.bottomAnchor))
        constraints.append(taxiEndAddress.topAnchor.constraint(equalTo: taxiStartAddress.bottomAnchor))
        
        constraints.append(taxiOrderTime.leftAnchor.constraint(equalTo: taxiEndAddress.leftAnchor))
        constraints.append(taxiOrderTime.rightAnchor.constraint(equalTo: taxiOrderTime.rightAnchor))
        constraints.append(taxiOrderTime.topAnchor.constraint(equalTo: taxiEndAddress.bottomAnchor))
        constraints.append(taxiOrderTime.bottomAnchor.constraint(equalTo: taxiOrderTime.bottomAnchor))
        
        constraints.append(taxiPrice.leftAnchor.constraint(equalTo: taxiStartAddress.leftAnchor))
        constraints.append(taxiPrice.rightAnchor.constraint(equalTo: taxiPrice.rightAnchor))
        constraints.append(taxiPrice.bottomAnchor.constraint(equalTo: taxiPrice.bottomAnchor))
        constraints.append(taxiPrice.topAnchor.constraint(equalTo: taxiOrderTime.bottomAnchor))
        
        
    
        NSLayoutConstraint.activate(constraints)

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
   /* override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        var contentConfig = defaultContentConfiguration().updated(for: state)
        contentConfig.text = taxiLabel.text
        contentConfiguration = contentConfig
        var backgroundConfig = backgroundConfiguration?.updated(for: state)
        backgroundConfig?.backgroundColor = .purple
        backgroundConfig = backgroundConfiguration
    }*/
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(taxiEndAddress)
        contentView.addSubview(taxiImageView)
        contentView.addSubview(taxiPrice)
        contentView.addSubview(taxiStartAddress)
        contentView.addSubview(taxiOrderTime)
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    }



