defmodule Toy.ReleaseTask.Migrations do
  @moduledoc false

  use Toy.ReleaseTask,
    start_apps: [:ssl, :crypto, :postgrex, :ecto, :ecto_sql, :logger],
    load_apps: [:toy],
    repositories: [
      Toy.Repo
    ]

  alias Ecto.Migrator

  @spec migrations() :: term
  def migrations do
    prepare()

    # Look at migrations
    Enum.each(@repos, &get_list/1)

    # Signal shutdown
    IO.puts("\nShutting Down...")
    :init.stop()
  end

  defp get_list(repo) do
    app = Keyword.get(repo.config, :otp_app)
    IO.puts("\nMigration status for #{app}\n")

    Enum.each(Migrator.migrations(repo, Migrator.migrations_path(repo)), fn
      {status, migration_number, name} -> IO.puts("  #{status}\t#{migration_number}\t#{name}")
    end)
  end
end
