import Vapor
import HTTP
import Foundation

public func setup(_ drop: Droplet) throws {
    drop.get("test", String.self, handler: pathHandler)
}

func pathHandler(request: Request, name: String) throws -> ResponseRepresentable {
    guard let decodedName = name.removingPercentEncoding else {
        throw Abort.badRequest
    }
    return decodedName
}
