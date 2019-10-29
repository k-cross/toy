import Config

config :toy, ToyWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 4000],
  url: [host: "example.com", port: 80],
  server: true,
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

config :toy, Toy.Repo,
  username: "toy",
  password: "toys",
  database: "toy",
  hostname: "localhost",
  pool_size: 10
