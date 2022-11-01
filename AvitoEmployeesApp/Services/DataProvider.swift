import UIKit

//class DataProvider {
//    
//    static let shared = DataProvider()
//    
//    private init() {}
//    
//    public func fetchData(completion: @escaping (ModelData?) -> Void) {
//        guard let url = URL(string: Contstants.dataUrlString) else { return }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async {
//                let modelData = ModelData()
//                completion(modelData)
//            }
//        }
//        task.resume()
//    }
//    
//}
