
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NewsAPI.service.newsAPIProtocol = self
        NewsAPI.service.getHeadlines(country: "Portugal")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: NewsAPIProtocol {
    func newsAPIHeadlines(headlines: [Headline]?) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsAPI.service.headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Headlines", for: indexPath) as! HeadlineCell
        cell.dataModel = NewsAPI.service.headlines[indexPath.row]
        return cell
    }
}

