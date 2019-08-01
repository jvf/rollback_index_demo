use Mix.Config

config :friends, Friends.Repo,
  database: "friends_repo",
  username: "root",
  hostname: "localhost",
  port: 26257

config :friends, ecto_repos: [Friends.Repo]
