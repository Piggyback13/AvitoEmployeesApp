import UIKit

class EmployeesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EmployeePresenterDelegate {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var employees = [Employee]()
    
    private let presenter = EmployeePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Avito Employeers"
        
        // Table
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getModelData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = employees[indexPath.row].name
        return cell
    }
   
    // Presenter Delegate
    func presentEmployees(employees: [Employee]) {
        self.employees = employees
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

