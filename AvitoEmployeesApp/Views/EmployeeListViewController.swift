import UIKit

class EmployeeListViewController: UIViewController {
    
    // MARK: - Properties
    var tableView = UITableView()
    private var employees = [Employee]()
    private let presenter = EmployeePresenter()
    
    // MARK: - Override functionses
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Avito Employeers"
        configureTableView()
        setPresenterDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkNetworkConnection()
        
    }
    
    // MARK: - Functions
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: TextContstants.employeeCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setPresenterDelegates() {
        presenter.setViewDelegate(delegate: self)
        presenter.getModelData()
    }

}

// MARK: - Extentions
extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource, EmployeePresenterDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextContstants.employeeCell, for: indexPath) as! EmployeeCell
        let employee = employees[indexPath.row]
        cell.set(employee: employee)
        
        return cell
    }
    
    func presentEmployees(employees: [Employee]) {
        self.employees = employees
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
