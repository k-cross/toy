~w(rel plugins *.exs)
|> Path.join()
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"qXLq$9i?~b%wMK2FO]*[*][.,2XWX@8BG~z}RiEfBA_D9]MApC;QM`o$Mw&u<_;>"
  set vm_args: "rel/vm.args"
  set config_providers: [
    {Toml.Provider, [path: "${HOME}/config.toml"]}
  ]
end

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"WdtNqoYWLJ8&q}!7YGDwjz.3w*QSiDeaCGL4}ga`cel[/GoPEs~/KxGwsf2*e,mU"
  set config_providers: [
    {Toml.Provider, [path: "${RELEASE_ROOT_DIR}/config.toml"]}
  ]
  set overlays: [
    {:copy, "config/defaults.toml", "config.toml"}
  ]
end

release :toy do
  set version: current_version(:toy)
  set applications: [
    :runtime_tools,
    toy: :permanent
  ]
  set commands: [
    migrations: "rel/commands/migrations.sh"
  ]
end
