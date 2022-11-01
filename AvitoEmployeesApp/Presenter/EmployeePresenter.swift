import Foundation
import UIKit

protocol EmployeePresenterDelegate: AnyObject {
    func presentEmployees(employees: [Employee])
}

typealias PresenterDelegate = EmployeePresenterDelegate & UIViewController

class EmployeePresenter {
    
    weak var delegate: PresenterDelegate?
    
    var modelData: ModelData?
    var employees: [Employee] = []
    
    public func getModelData() {
            guard let url = URL(string: TextContstants.dataUrlString) else { return }
                    
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = ["authToken": "nil"]
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                guard let data = data, error == nil else { return }
                
                do {
                    let modelData = try JSONDecoder().decode(ModelData.self, from: data)
                    self?.delegate?.presentEmployees(employees: modelData.company.employees.sorted(by: { $0.name < $1.name }))
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            task.resume()
        }
    
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
}
