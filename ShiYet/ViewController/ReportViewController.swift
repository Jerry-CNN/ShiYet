import Foundation

import UIKit

class ReportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }


    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let contentView = UIView()
    
    @IBOutlet weak var ReportSection: UIScrollView!
    
    func setupScrollView() {
        // 将滚动视图添加到视图控制器的视图中
        view.addSubview(ReportSection)
        
        // 将内容视图添加到滚动视图中
        ReportSection.addSubview(contentView)
        
        // 启用横向滚动
        ReportSection.isScrollEnabled = true
        
        // 设置内容视图的背景色（这只是为了示例）
        contentView.backgroundColor = UIColor.red
        
        // 添加内容视图的约束，使其与滚动视图大小相同，横向滚动
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: ReportSection.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: ReportSection.leadingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: ReportSection.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: ReportSection.trailingAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: ReportSection.heightAnchor).isActive = true
        
        // 设置内容视图的宽度，这将决定横向滚动的范围
        contentView.widthAnchor.constraint(equalTo: ReportSection.widthAnchor, multiplier: 2.0).isActive = true
    }

}
