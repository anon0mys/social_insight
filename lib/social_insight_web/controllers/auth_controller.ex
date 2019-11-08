defmodule SocialInsightWeb.AuthController do
  @moduledoc """
  Auth controller
  """

  use SocialInsightWeb, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias SocialInsight.Facebook.FBUser

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user = FBUser.transform(auth)
    require IEx; IEx.pry()
  end
end
