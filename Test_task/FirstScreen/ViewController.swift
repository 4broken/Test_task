//
//  ViewController.swift
//  Test_task
//
//  Created by Shamil Mazitov on 16.06.2022.
//

import UIKit
class ViewController: UIViewController {
    let example = TaxiInfoManager()
    var array = [PrimaryData]()
    var arrayOfImages = [UIImage]()
    let urlInfo = URL(string: "https://www.roxiemobile.ru/careers/test/orders.json")
    
    lazy var tableView: UITableView = {
            let table = UITableView(frame: view.bounds, style: .plain)
            table.delegate = self
            table.dataSource = self
            table.register(TaxiTableViewCell.self, forCellReuseIdentifier: TaxiTableViewCell.identifier)
        table.rowHeight = UITableView.automaticDimension
        table.rowHeight = 110
            return table
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Taxi"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        example.getFile() {[unowned self] sortedInfo,image in
                self.array = sortedInfo!
            DispatchQueue.main.async {
                self.arrayOfImages.append(image)
                tableView.reloadData()

            }
            
        }

    }
     
     var taxiImageView: UIImageView = {
        var imageView = UIImageView()
         
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        
        return imageView
    }()
    
    func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect(origin: .zero, size: size)
    }
    
     func convertStringCurrencyToNumber(strCurrency: String, locale: String) -> Double {
        let formatter = NumberFormatter()
        formatter.currencyCode = locale
         formatter.numberStyle = .currency
        if let converted: Double = formatter.number(from: strCurrency)?.doubleValue {
            return converted
        } else {
            return 0.0
        }
    }
    
    func convertPrice(amount: Int, locale: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = locale
        guard let string = formatter.string(from: NSNumber(value: amount)) else { return "none" }
        return string
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: {(context) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = TaxiTableViewCell.identifier
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier,
                                                     for: indexPath) as? TaxiTableViewCell
        else {
            fatalError()
        }
        let info = array[indexPath.row]
        let price = convertPrice(amount: info.price.amount, locale: info.price.currency)
        cell.taxiStartAddress.text = info.startAddress.address
        cell.taxiEndAddress.text = info.endAddress.address
        cell.taxiOrderTime.text = Date().getDateString(date: info.orderTime)
        cell.taxiPrice.text = String(price)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let info = array[indexPath.row]
        let imagesss = arrayOfImages[indexPath.row]
        let destinationVC = TaxiViewController()
        destinationVC.navigationItem.title = "Detalized"
        destinationVC.startAddress = info.startAddress.address
        destinationVC.endAddress = info.endAddress.address
        destinationVC.vehicle = info.vehicle.modelName
        destinationVC.orderedTime = info.orderTime
        destinationVC.sameArray = array
        destinationVC.price = String(convertPrice(amount: info.price.amount, locale: info.price.currency))
        destinationVC.imageTaxi?.image = imagesss
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
extension Date {
    func getDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: date)
    }
}


