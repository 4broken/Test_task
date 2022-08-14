//
//  Dat.swift
//  Test_task
//
//  Created by Shamil Mazitov on 19.06.2022.
//

import Foundation
import UIKit

class TaxiInfoManager {
    var imageCache = NSCache<NSString, UIImage>()
    
    let fileURL = URL(string: "https://www.roxiemobile.ru/careers/test/orders.json")
    var firstPartOfURL = "https://www.roxiemobile.ru/careers/test/images/"
    var sortedInfo: [PrimaryData] = []
    var arrayOfImages: [String] = []
    static let sharedInfo = TaxiInfoManager()
    enum TaxiCodingKeys: String {
        case jsonData
    }
     func getFile(completion: @escaping ([PrimaryData]?, UIImage) -> Void) {
         
       var request = URLRequest(url: fileURL!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){[unowned self]data,response,error in
            guard let data = data else {
                return
            }
            do {
//                var result = try? JSONDecoder().decode([PrimaryData].self, from: data)
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try? decoder.decode([PrimaryData].self, from: data)
                let sorted = result?.sorted(by: {$0.orderTime > $1.orderTime})
                sorted?.forEach({  item in
                     self.sortedInfo.append(item)
                     let newURL = self.firstPartOfURL + item.vehicle.photo
                    guard let url = URL(string: newURL) else{return}
                    if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
                        completion(self.sortedInfo,cachedImage)
                    } else {
                        let request = URLRequest(url: URL(string: newURL)!,cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 10)
                    URLSession.shared.dataTask(with: request) { data,responce,_ in
                        print(data)
                        guard let image = UIImage(data: data!),
                              let responce = responce as? HTTPURLResponse,
                            responce.statusCode == 200 else{return}
                        self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        completion(self.sortedInfo,image)
                    
                    }.resume()
                    }
                     self.arrayOfImages.append(newURL)
                })
                
                print(self.sortedInfo)
            } catch let error {
                print(error)
            }
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
        }.resume()
        
}
    
    
    func fetchImage(completion: @escaping (Data?) -> Void) {
        arrayOfImages.forEach { item in
            guard let url = URL(string: item) else {return}
            /*if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
                completion(cachedImage)
            } else {
            let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 10)*/
            URLSession.shared.dataTask(with: url) { data,responce,error in
                guard error == nil,
                      data != nil,
                        let responce = responce as? HTTPURLResponse,
                      responce.statusCode == 200 else{return}
//                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    completion(data)
                }
            }.resume()
        }
    }
    
}
//}
/*class TaxiImageManager {
    static let shared = TaxiImageManager()
    
    private init() {}
    
    func fetchImage(from url : URL, completion: @escaping(Data, URLResponse)-> Void) {
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard let data = data, let responce = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            guard url == response?.url else { return }
            completion(data,responce)
        }
    }
}*/
