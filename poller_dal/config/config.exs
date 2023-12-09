import Config

config :poller_dal, PollerDal.Repo,
  database: "poller_#{Mix.env()}",
  username: "braisoncrece",
  password: "Nonchadigo1213",
  hostname: "localhost"

config :poller_dal, ecto_repos: [PollerDal.Repo]
