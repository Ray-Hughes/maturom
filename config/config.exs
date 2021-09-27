import Config

config :forge,
  db: "./states.db"

config :forge, :app_info, {"Final Chapter", "0.1.0"}

import_config "#{Mix.env()}.exs"
