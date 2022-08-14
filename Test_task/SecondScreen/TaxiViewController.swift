//
//  TaxiViewController.swift
//  Test_task
//
//  Created by Shamil Mazitov on 20.06.2022.
//

import UIKit

class TaxiViewController: UIViewController {
    var startAddress: String?
    var endAddress: String?
    var orderedTime: Date?
    var vehicle: String?
    var imageTaxi: UIImageView? = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([image.widthAnchor.constraint(equalToConstant: 50),
                                     image.heightAnchor.constraint(equalToConstant: 50)])
        
        return image
    }()
    var price: String?
    var sameArray = [PrimaryData]()
   lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
       layout.itemSize = CGSize(width: view.frame.width, height: 700)
       let collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
       collection.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.customId)
       return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        
        
        
        
    }
   
}

extension TaxiViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.customId, for: indexPath) as? CustomCell else { fatalError()}
  guard let taxiDataSource = collectionView.dataSource else { fatalError() }
    cell.taxiStartAddress.text = startAddress
    cell.taxiEndAddress.text = endAddress
    cell.taxiOrderTime.text = Date().getDateString(date: orderedTime!)
    cell.taxiPrice.text = price
    cell.taxiImageView.image = imageTaxi?.image
        return cell
}
}
