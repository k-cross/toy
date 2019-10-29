import Config

config :toy, code_beam_sf: String.to_integer(System.fetch_env!("CODE_BEAM_SF"))
