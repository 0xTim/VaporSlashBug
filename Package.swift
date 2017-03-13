import PackageDescription

let package = Package(
    name: "SlashBugApp",
    targets: [
        Target(name: "App", dependencies: ["AppLogic"])
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources"
    ]
)
