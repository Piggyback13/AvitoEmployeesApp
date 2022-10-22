import Foundation
import UIKit

protocol ModelDataPresenterDelegate: AnyObject {
    func presentEmployees(employees: [Employee])
}

typealias PresenterDelegate = ModelDataPresenterDelegate & UIViewController

class ModelDataPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getModelData() {
        guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c") else { return }
                
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["authToken": "nil"]
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let modelData = try JSONDecoder().decode(ModelData.self, from: data)
                self?.delegate?.presentEmployees(employees: modelData.company.employees)
            } catch {
                print(error)
            }
//            if let data = data, let modelData = try? JSONDecoder().decode(ModelData.self, from: data) {
//                print(modelData.company.employees[0].skills)
//            }
        }
        
        task.resume()
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
}
