import Vapor
import VaporMySQL

let drop = Droplet()
try drop.addProvider(VaporMySQL.Provider.self)

drop.get { request in
  return try drop.view.make("index", [
    "episodes": try JSON(node: drop.database?.driver.raw([
      "SELECT *",
      "FROM episode",
      "ORDER BY number DESC"
      ].joined(separator: " ")))
    ])
}

drop.get("tracks", Int.self) { request, episodeNumber in
  return try JSON(node: drop.database?.driver.raw([
    "SELECT *",
    "FROM track",
    "WHERE episode_number = \(episodeNumber)",
    "ORDER BY start_time"
    ].joined(separator: " ")))
}

drop.run()
