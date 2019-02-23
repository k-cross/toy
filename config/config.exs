use Mix.Config

config :toy,
  ecto_repos: [Toy.Repo]

config :toy, ToyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OerIEUuStbmPBYs4Eri7WQReqqEvQISpy6rIFj+eP5sZbes4G2pOHcIvObf57e1d",
  render_errors: [view: ToyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Toy.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
