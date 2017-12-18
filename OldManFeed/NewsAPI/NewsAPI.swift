
import Foundation


protocol NewsAPIProtocol: class {
    func newsAPIHeadlines(headlines: [Headline]?)
}

class NewsAPI  {

    static var service = NewsAPI()
    var newsAPIProtocol: NewsAPIProtocol?

    private struct Response: Codable {
        let headlines: [Headline]?
        
        enum CodingKeys: String, CodingKey {
            case headlines = "sources"
        }
    }
    
    private enum API {
        
        private static let basePath = "https://newsapi.org/v1"
        private static let key = "7225dcde2d7c42c7960772ec4d1098e1"
        
        case headline
        case article(Headline)
       
        func fetch( completion: @escaping (Data) -> ()) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: path()) { (data, response, error) in
                guard let data = data, error == nil else { return }
                completion(data)
            }
            task.resume()
        }
        
        fileprivate func path() -> URL {
            return URL(string: "\(API.basePath)/sources")!
        }
    }
    
    private(set) var headlines: [Headline] = []
    
    func getHeadlines(country: String) {
        API.headline.fetch() { data in
            do {
                if let headlines = try JSONDecoder().decode(Response.self, from: data).headlines {
                    self.headlines = headlines
                    self.newsAPIProtocol?.newsAPIHeadlines(headlines: headlines)
                }
            } catch {
                
            }
        }
    }
}
