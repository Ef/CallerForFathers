
import Foundation

class Headline: Codable, CustomStringConvertible {
    var id: String
    var name: String
    var overview: String
    var url: String
    var category: String

    var description: String {
        return "\(name) 👉 \(category)"
    }
    
    init(id: String, name: String, overview: String, url: String, category: String) {
        self.id = id
        self.name = name
        self.overview = name
        self.url = url
        self.category = category
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview = "description"
        case url
        case category
    }
}
