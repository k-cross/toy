defmodule Toy.ReleaseTask do
  @moduledoc false

  defmacro __using__(start_apps: s_apps, load_apps: l_apps, repositories: repos) do
    quote do
      @start_apps unquote(s_apps)
      @load_apps unquote(l_apps)
      @repos unquote(repos)

      defp prepare do
        Enum.each(@load_apps, fn app ->
          IO.puts("Loading #{app}...")

          case Application.load(app) do
            :ok -> :ok
            {:error, :already_loaded} -> :ok
          end
        end)

        Enum.each(@start_apps, fn app ->
          IO.puts("Starting #{app}...")
          Application.ensure_all_started(app)
        end)

        Enum.each(@repos, fn repo ->
          IO.puts("Initializing #{repo}...")
          repo.start_link()
        end)
      end
    end
  end
end
