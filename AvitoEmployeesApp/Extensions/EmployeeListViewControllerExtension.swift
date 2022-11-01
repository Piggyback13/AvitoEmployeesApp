import UIKit

extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource, EmployeePresenterDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TextContstants.employeeCell, for: indexPath) as! EmployeeCell
        let employee = employees[indexPath.row]
        cell.set(employee: employee)
        cell.backgroundColor = .systemGray4
        return cell
    }
    
    func presentEmployees(employees: [Employee]) {
        self.employees = employees
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
