defmodule SocialInsight.Repo do
  use Ecto.Repo,
    otp_app: :social_insight,
    adapter: Ecto.Adapters.Postgres
end
