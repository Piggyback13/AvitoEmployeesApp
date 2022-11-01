import UIKit

class EmployeeCell: UITableViewCell {
    
    // MARK: - Properties
    var employeeImage = UIImageView()
    var employeeNameLabel = UILabel()
    var employeePhoneLabel = UILabel()
    var employeeSkillsLabel = UILabel()
    
    // MARK: - Override init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(employeeImage)
        addSubview(employeeNameLabel)
        addSubview(employeePhoneLabel)
        addSubview(employeeSkillsLabel)

        configureImageView()
        configureNameLabel()
        configurePhoneNumber()
        configureSkills()

        setImageConstraints()
        setNameLabelConstraints()
        setPhoneLabelConstraints()
        setSkillsLabelConstraints()
    }

    // MARK: - Required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set function for cell elements
    func set(employee: Employee) {
        employeeImage.image = UIImage(named: TextContstants.employeeImageName)
        
        employeeNameLabel.text = employee.name
        employeeNameLabel.font = UIFont.boldSystemFont(ofSize: 28)
        
        employeePhoneLabel.text = "Phone: " + employee.phoneNumber
        employeePhoneLabel.font = UIFont.systemFont(ofSize: 22)
        
        employeeSkillsLabel.text = "Skills: " + employee.skills.joined(separator: ", ")
        employeeSkillsLabel.font = UIFont.systemFont(ofSize: 22)
    }
    
    // MARK: - Configure functions
    func configureImageView() {
        employeeImage.layer.cornerRadius = 29
        employeeImage.clipsToBounds = true
    }
    
    func configureNameLabel() {
        employeeNameLabel.numberOfLines = 0
        employeeNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configurePhoneNumber() {
        employeePhoneLabel.numberOfLines = 0
        employeePhoneLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureSkills() {
        employeeSkillsLabel.numberOfLines = 0
        employeeSkillsLabel.adjustsFontSizeToFitWidth = true
    }
    
    // MARK: - Set functions (constraints)
    func setImageConstraints() {
        employeeImage.translatesAutoresizingMaskIntoConstraints = false
        employeeImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        employeeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        employeeImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        employeeImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setNameLabelConstraints() {
        employeeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        employeeNameLabel.leadingAnchor.constraint(equalTo: employeeImage.trailingAnchor, constant: 20).isActive = true
        employeeNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        employeeNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        employeeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setPhoneLabelConstraints() {
        employeePhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        employeePhoneLabel.leadingAnchor.constraint(equalTo: employeeImage.trailingAnchor, constant: 20).isActive = true
        employeePhoneLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        employeePhoneLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        employeePhoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setSkillsLabelConstraints() {
        employeeSkillsLabel.translatesAutoresizingMaskIntoConstraints = false
        employeeSkillsLabel.leadingAnchor.constraint(equalTo: employeeImage.trailingAnchor, constant: 20).isActive = true
        employeeSkillsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        employeeSkillsLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        employeeSkillsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

}
