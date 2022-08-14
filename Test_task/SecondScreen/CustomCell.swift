//
//  CustomCell.swift
//  Test_task
//
//  Created by Shamil Mazitov on 20.06.2022.
//

import Foundation
import UIKit
class CustomCell: UICollectionViewCell {
    static let customId = "CustomCell"
    
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
    
    lazy var taxiImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    func setupConstraints() {
        let offset: CGFloat = 30
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
        
        constraints.append(taxiImageView.widthAnchor.constraint(equalToConstant: 200))
        constraints.append(taxiImageView.heightAnchor.constraint(equalToConstant: 200))
        constraints.append(taxiImageView.topAnchor.constraint(equalTo: taxiPrice.bottomAnchor))
        constraints.append(taxiImageView.leftAnchor.constraint(equalTo: taxiStartAddress.leftAnchor))
        NSLayoutConstraint.activate(constraints)
        
    }
    
    func addViews() {
        addSubview(taxiEndAddress)
        addSubview(taxiImageView)
        addSubview(taxiPrice)
        addSubview(taxiStartAddress)
        addSubview(taxiOrderTime)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
