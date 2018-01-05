
import Foundation

class Headline: Codable, CustomStringConvertible {
    var id: String
    var name: String
    var overview: String
    var url: String
    var category: String

    var description: String {
        return "\(name) 👉 \(category) 👉 \(overview)"
    }
    
    init(id: String,
         name: String,
         overview: String,
         url: String,
         category: String) {
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


extension Headline {
    private struct Response: Codable {
        let headlines: [Headline]?
        enum CodingKeys: String, CodingKey {
            case headlines = "sources"
        }
    }
    private static let basePath = "https://newsapi.org/v1"
    private static let key = "7225dcde2d7c42c7960772ec4d1098e1"
    
    static let all = ServiceResources<[Headline]>(url: URL(string: "\(basePath)/sources")!, parse: { data in
        do {
            let headlines = try JSONDecoder().decode(Response.self, from: data).headlines
            return headlines ?? []
        } catch {
            return []
        }
    })
}


