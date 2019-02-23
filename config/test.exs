use Mix.Config

config :toy, ToyWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn

config :toy, Toy.Repo,
  username: "conjure",
  password: "conjurer",
  database: "conjure_test",
  hostname: "localhost",
  pool_size: 10
