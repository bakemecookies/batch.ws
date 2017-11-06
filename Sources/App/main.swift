import Vapor
import LeafProvider
import MySQLProvider

let config = try Config()
try config.addProvider(LeafProvider.Provider.self)
try config.addProvider(MySQLProvider.Provider.self)

let drop = try Droplet(config)

drop.get { _ in
  return try drop.view.make("index", [
    "episodes": try JSON(node: drop.database?.driver.raw([
      "SELECT *",
      "FROM episode",
      "ORDER BY number DESC"
      ].joined(separator: " ")))
    ])
}

drop.get("tracks", Int.parameter) { request in
  let episodeNumber = try request.parameters.next(Int.self)
  return try JSON(node: drop.database?.driver.raw([
    "SELECT *",
    "FROM track",
    "WHERE episode_number = \(episodeNumber)",
    "ORDER BY start_time"
    ].joined(separator: " ")))
}

try drop.run()
