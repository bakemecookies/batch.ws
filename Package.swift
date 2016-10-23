import PackageDescription

let package = Package(
  name: "batch.ws",
  dependencies: [
    .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 1),
    .Package(url: "https://github.com/vapor/mysql-provider.git", majorVersion: 1, minor: 1)
  ]
)
