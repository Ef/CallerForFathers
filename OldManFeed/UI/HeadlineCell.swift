import UIKit

class HeadlineCell: UITableViewCell {
    var dataModel: Headline? {
        didSet{
            guard let source = dataModel else {return}
            overview.text = source.overview
        }
    }
  @IBOutlet private var overview: UILabel!
}
