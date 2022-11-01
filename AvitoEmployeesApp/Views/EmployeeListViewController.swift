import UIKit

class EmployeeListViewController: UIViewController {
    
    // MARK: - Properties
    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    var employees = [Employee]()
    private let presenter = EmployeePresenter()
    
    // MARK: - Override functions
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let topSafeArea: CGFloat
        let bottomSafeArea: CGFloat
        
        if #available(iOS 11.0, *) {
            topSafeArea = view.safeAreaInsets.top
            bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            topSafeArea = topLayoutGuide.length
            bottomSafeArea = bottomLayoutGuide.length
        }
    }
    
    // MARK: - Functions
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: TextContstants.employeeCell)
        tableView.pin(to: view)
        tableView.backgroundColor = .systemGray6
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
