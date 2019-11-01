# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :social_insight,
  ecto_repos: [SocialInsight.Repo]

# Configures the endpoint
config :social_insight, SocialInsightWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "REmvFXiFZ7UVdC2cT0qFGfKWgUWJcEUqw67A0SlF3u/DNtLZ8D3PTuOYarWrJD4l",
  render_errors: [view: SocialInsightWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SocialInsight.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    facebook: { Ueberauth.Strategy.Facebook, [default_scope: "email,public_profile"]}
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_APP_ID"),
  client_secret: System.get_env("FACEBOOK_APP_SECRET"),
  redirect_uri: System.get_env("FACEBOOK_REDIRECT_URI")
