import Foundation
import Hummingbird

struct Todo {
    var id: UUID
    var title: String
    var completed: Bool?
    var order: Int?
    var url: String
}

extension Todo: ResponseEncodable, Decodable, Equatable {}
