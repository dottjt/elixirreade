# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config


# General application configuration
config :portfolio,
  ecto_repos: [Portfolio.Repo],
  google_analytics_tracking_id: "UA-85083093-1",
  website_alt_image: "images/cool/cool1.jpg"


# Configures the endpoint
config :portfolio, PortfolioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UNKdw3n8t1imKvRmolBW70P8kXjh6WHtGVidb+XBhxHX146Zo1KfYobmiWnGCmrF",
  render_errors: [view: PortfolioWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Portfolio.PubSub,
           adapter: Phoenix.PubSub.PG2]


config :portfolio, Portfolio.Scheduler,
  jobs: [
    # Every day at mid-day
    {"0 12 * * *", {Portfolio.Sitemaps, :generate, []}} # 
    # {"40 23 * * *", {ProductScheduler, :publish_scheduled_posts, []}} 
  ]

config :ex_admin,
  repo: Portfolio.Repo,
  module: Portfolio,    # Portfolio.Web for phoenix >= 1.3.0-rc 
  modules: [
    Portfolio.ExAdmin.Dashboard,
    Portfolio.ExAdmin.Project,
    Portfolio.ExAdmin.Category,
    Portfolio.ExAdmin.Item,
    Portfolio.ExAdmin.Tag,
  ]


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :arc,
  storage: Arc.Storage.Local

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Portfolio.Coherence.User,
  repo: Portfolio.Repo,
  module: Portfolio,
  web_module: PortfolioWeb,
  router: PortfolioWeb.Router,
  messages_backend: PortfolioWeb.Coherence.Messages,
  logged_out_url: "/",
  opts: [:authenticatable]
# %% End Coherence Configuration %%



# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


config :xain, :after_callback, {Phoenix.HTML, :raw}

