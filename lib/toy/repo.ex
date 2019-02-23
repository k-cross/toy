defmodule Toy.Repo do
  use Ecto.Repo,
    otp_app: :toy,
    adapter: Ecto.Adapters.Postgres
end
