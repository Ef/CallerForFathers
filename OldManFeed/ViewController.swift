
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var dataSource: [Headline]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsAPI().fetch(resource: Headline.all) { [unowned self] result in
            DispatchQueue.main.async {
                self.dataSource = result
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource != nil ? (self.dataSource?.count)! : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Headlines", for: indexPath) as! HeadlineCell
        if let model = self.dataSource {
             cell.dataModel = model[indexPath.row]
        }
        return cell
    }
}

