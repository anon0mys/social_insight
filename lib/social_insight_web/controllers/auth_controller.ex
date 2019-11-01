defmodule SocialInsightWeb.AuthController do
  @moduledoc """
  Auth controller
  """

  use SocialInsightWeb, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    require IEx; IEx.pry
  end
end
