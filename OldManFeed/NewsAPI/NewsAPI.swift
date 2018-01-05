
import Foundation

class NewsAPI  {
    func fetch<A>(resource: ServiceResources<A>, completion: @escaping (A?) -> ()) {
        URLSession(configuration: .default).dataTask(with: resource.url) { data, _ , _ in
            completion(data.flatMap(resource.parse))
        }.resume()
    }
}
