import Foundation

struct ServiceResources<A> {
    let url: URL
    let parse: (Data) -> A
}

