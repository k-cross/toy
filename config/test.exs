import Config

config :toy, ToyWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
