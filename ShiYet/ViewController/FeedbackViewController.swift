import Foundation

import UIKit

class FeedbackViewController: UIViewController {
    
    // Static function for create a vc from storyboard with parameters
    static func makeFeedbackVC(current_time: Date) -> FeedbackViewController {
            let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController
            
            newViewController.current_time = current_time
            
            return newViewController
        }
    
    @IBAction func Quit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var current_time: Date? = nil
    var submitted = false
    
    @IBAction func submit(_ sender: Any) {
            if !submitted {
                let reportVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReportViewController") as! ReportViewController

                // Present the FeedbackViewController
                self.present(reportVC, animated: true, completion: nil)
                submitted = true
                (sender as AnyObject).setTitle("Quit", for: .normal)
            }
            else {
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    
    var shapeRadioButtons: [UIButton] = []
    var colorRadioButtons: [UIButton] = []
    var amountRadioButtons: [UIButton] = []
    var feelRadioButtons: [UIButton] = []
    var smellRadioButtons: [UIButton] = []
    var bloodRadioButtons: [UIButton] = []
    var stickyRadioButtons: [UIButton] = []
    
    @IBAction func radioButtonSet1Tapped(_ sender: UIButton) {
        for button in shapeRadioButtons {
            button.isSelected = (button == sender)
            if button.isSelected {
                button.backgroundColor = UIColor.blue
            } else {
                button.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
            }
        }
    }
    
    @IBAction func radioButtonSet2Tapped(_ sender: UIButton) {
        for button in colorRadioButtons {
            button.isSelected = (button == sender)
            if button.isSelected {
                button.backgroundColor = UIColor.blue
            } else {
                button.backgroundColor = UIColor.white
            }
        }
    }
    
    @IBAction func radioButtonSet3Tapped(_ sender: UIButton) {
        for button in amountRadioButtons {
            button.isSelected = (button == sender)
            if button.isSelected {
                button.backgroundColor = UIColor.blue
            } else {
                button.backgroundColor = UIColor.white
            }
        }
    }
    @IBAction func radioButtonSet4Tapped(_ sender: UIButton) {
        for button in feelRadioButtons {
            button.isSelected = (button == sender)
            if button.isSelected {
                button.backgroundColor = UIColor.blue
            } else {
                button.backgroundColor = UIColor.white
            }
        }
    }
    
    @IBAction func radioButtonSet5Tapped(_ sender: UIButton) {
        for button in smellRadioButtons {
            button.isSelected = (button == sender)
            if button.isSelected {
                button.backgroundColor = UIColor.blue
            } else {
                button.backgroundColor = UIColor.white
            }
        }
    }
    
    @IBAction func radioButtonSet6Tapped(_ sender: UIButton) {
        for button in bloodRadioButtons {
            button.isSelected = (button == sender)
            if button.isSelected {
                button.backgroundColor = UIColor.blue
            } else {
                button.backgroundColor = UIColor.white
            }
        }
    }
    
    @IBAction func radioButtonSet7Tapped(_ sender: UIButton) {
        for button in stickyRadioButtons {
            button.isSelected = (button == sender)
            if button.isSelected {
                button.backgroundColor = UIColor.blue
            } else {
                button.backgroundColor = UIColor.white
            }
        }
    }
    
    let shapeLabel: UILabel = {
            let label = UILabel()
            label.text = "Shape"
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let shapeRadio: UIStackView = {
        let stack = UIStackView()
        var shapeIcon:[String] = ["banana","rabbit","gravy","oatmeal"]
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        for i in 0...3{
            let button = UIButton()
            button.addTarget(self, action: #selector(radioButtonSet1Tapped(_:)), for: .touchUpInside)
            button.setBackgroundImage(UIImage(named:shapeIcon[i]), for: .normal)
            stack.addArrangedSubview(button)
        }
        return stack
    }()
    
    let colorLabel: UILabel = {
            let label = UILabel()
            label.text = "Color"
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let colorRadio: UIStackView = {
        let stack = UIStackView()
        var colorIcon:[String] = ["red","black","coffee","yellow"]
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        for i in 0...3{
            let button = UIButton()
            button.addTarget(self, action: #selector(radioButtonSet2Tapped(_:)), for: .touchUpInside)
            button.imageView?.contentMode = .scaleAspectFit
            button.setBackgroundImage(UIImage(named: colorIcon[i]), for: .normal)
            stack.addArrangedSubview(button)
        }
        return stack
    }()
    
    let amountLabel: UILabel = {
            let label = UILabel()
            label.text = "Amount"
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let amountRadio: UIStackView = {
        let stack = UIStackView()
        var amountIcon:[String] = ["general","Large","Little"]
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        for i in 0...2{
            let button = UIButton()
            button.setTitle(amountIcon[i], for: .normal)
            button.addTarget(self, action: #selector(radioButtonSet3Tapped(_:)), for: .touchUpInside)
            stack.addArrangedSubview(button)
        }
        return stack
    }()
    
    let feelLabel: UILabel = {
            let label = UILabel()
            label.text = "Feel"
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let feelRadio: UIStackView = {
        let stack = UIStackView()
        var feelIcon:[String] = ["easy","difficult","again"]
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        for i in 0...2{
            let button = UIButton()
            button.setTitle(feelIcon[i], for: .normal)
            button.addTarget(self, action: #selector(radioButtonSet4Tapped(_:)), for: .touchUpInside)
            stack.addArrangedSubview(button)
        }
        return stack
    }()
    
    let smellLabel: UILabel = {
            let label = UILabel()
            label.text = "Smell"
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let smellRadio: UIStackView = {
        let stack = UIStackView()
        var smellIcon:[String] = ["bun","egg","deadfish","durian"]
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        for i in 0...3{
            let button = UIButton()
            button.addTarget(self, action: #selector(radioButtonSet5Tapped(_:)), for: .touchUpInside)
            button.setBackgroundImage(UIImage(named: smellIcon[i]), for: .normal)
            stack.addArrangedSubview(button)
        }
        return stack
    }()
    
    let bloodLabel: UILabel = {
            let label = UILabel()
            label.text = "Blood"
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let bloodRadio: UIStackView = {
        let stack = UIStackView()
        let blooda :[String] = ["blood","no blood"]
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        for i in 0...1{
            let button = UIButton()
            button.setTitle(blooda[i], for: .normal)
            button.setBackgroundImage(UIImage(named: blooda[i]), for: .normal)
            stack.addArrangedSubview(button)
        }
        return stack
    }()
    
    let stickyLabel: UILabel = {
            let label = UILabel()
            label.text = "Sticky"
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    let stickyRadio: UIStackView = {
        let stack = UIStackView()
        let blooda :[String] = ["sticky","not sticky"]
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        stack.translatesAutoresizingMaskIntoConstraints = false
        for i in 0...1{
            let button = UIButton()
            button.setTitle(blooda[i], for: .normal)
            button.addTarget(self, action: #selector(radioButtonSet7Tapped(_:)), for: .touchUpInside)
            stack.addArrangedSubview(button)
        }
        return stack
    }()
    
    let timeLabel: UILabel = {
            let label = UILabel()
            label.text = "Time: "
        label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(shapeLabel)
        view.addSubview(shapeRadio)
        view.addSubview(colorLabel)
        view.addSubview(colorRadio)
        view.addSubview(amountLabel)
        view.addSubview(amountRadio)
        view.addSubview(feelLabel)
        view.addSubview(feelRadio)
        view.addSubview(smellLabel)
        view.addSubview(smellRadio)
        view.addSubview(bloodLabel)
        view.addSubview(bloodRadio)
        view.addSubview(stickyLabel)
        view.addSubview(stickyRadio)
        view.addSubview(timeLabel)
        
        for subview in shapeRadio.arrangedSubviews{
            if let button = subview as? UIButton {
                shapeRadioButtons.append(button)
            }
        }
        
        for subview in colorRadio.arrangedSubviews{
            if let button = subview as? UIButton {
                colorRadioButtons.append(button)
            }
        }
        
        for subview in amountRadio.arrangedSubviews{
            if let button = subview as? UIButton {
                amountRadioButtons.append(button)
            }
        }
        
        for subview in feelRadio.arrangedSubviews{
            if let button = subview as? UIButton {
                feelRadioButtons.append(button)
            }
        }
        
        for subview in smellRadio.arrangedSubviews{
            if let button = subview as? UIButton {
                smellRadioButtons.append(button)
            }
        }
        for subview in bloodRadio.arrangedSubviews{
            if let button = subview as? UIButton {
                bloodRadioButtons.append(button)
            }
        }
        for subview in stickyRadio.arrangedSubviews{
            if let button = subview as? UIButton {
                stickyRadioButtons.append(button)
            }
        }
        
        
        // Set up constraints for the label
        NSLayoutConstraint.activate([
            shapeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            shapeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Set up constraints for the stack view just below the label
        NSLayoutConstraint.activate([
            shapeRadio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shapeRadio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shapeRadio.topAnchor.constraint(equalTo: shapeLabel.bottomAnchor, constant: 20),
            shapeRadio.widthAnchor.constraint(equalTo: view.widthAnchor),
            colorLabel.topAnchor.constraint(equalTo: shapeRadio.bottomAnchor,constant: 20),
            colorRadio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorRadio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            colorRadio.topAnchor.constraint(equalTo: colorLabel.bottomAnchor,constant: 20),
            amountLabel.topAnchor.constraint(equalTo: colorRadio.bottomAnchor,constant: 20),
            amountRadio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            amountRadio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            amountRadio.topAnchor.constraint(equalTo: amountLabel.bottomAnchor,constant: 20),
            feelLabel.topAnchor.constraint(equalTo: amountRadio.bottomAnchor,constant: 20),
            feelRadio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feelRadio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feelRadio.topAnchor.constraint(equalTo: feelLabel.bottomAnchor,constant: 20),
            smellLabel.topAnchor.constraint(equalTo: feelRadio.bottomAnchor,constant: 20),
            smellRadio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            smellRadio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            smellRadio.topAnchor.constraint(equalTo: smellLabel.bottomAnchor,constant: 20),
            smellRadio.bottomAnchor.constraint(equalTo: smellRadio.topAnchor,constant: 60),
            bloodLabel.topAnchor.constraint(equalTo: smellRadio.bottomAnchor,constant: 20),
            bloodRadio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bloodRadio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bloodRadio.topAnchor.constraint(equalTo: bloodLabel.bottomAnchor,constant: 20),
            stickyLabel.topAnchor.constraint(equalTo: bloodRadio.bottomAnchor,constant: 20),
            stickyRadio.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stickyRadio.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stickyRadio.topAnchor.constraint(equalTo: stickyLabel.bottomAnchor,constant: 20),
            timeLabel.topAnchor.constraint(equalTo: stickyRadio.bottomAnchor,constant: 20)
        ])
    }
    
    // Fetch user's choices
    func getListOfStrings() -> [Any] {
        var shape: String = ""
        var color: String = ""
        var amount: String = ""
        var feel: String = ""
        var smell: String = ""
        var blood: Bool = false
        var sticky: Bool = false
        
        for button in shapeRadioButtons {
            if button.isSelected {
                shape = button.currentTitle!
            }
        }
        
        for button in colorRadioButtons {
            if button.isSelected {
                color = button.currentTitle!
            }
        }
        
        for button in amountRadioButtons {
            if button.isSelected {
                amount = button.currentTitle!
            }
        }
        
        for button in feelRadioButtons {
            if button.isSelected {
                feel = button.currentTitle!
            }
        }
        
        for button in smellRadioButtons {
            if button.isSelected {
                smell = button.currentTitle!
            }
        }
        
        for button in stickyRadioButtons {
            if button.isSelected {
                sticky = true
            }
        }
        
        for button in bloodRadioButtons {
            if button.isSelected {
                blood = true
            }
        }
        
        return [shape, color, amount, feel, smell, sticky, blood]
    }
    
    
    
}


