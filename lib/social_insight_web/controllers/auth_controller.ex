defmodule SocialInsightWeb.AuthController do
  @moduledoc """
  Auth controller
  """

  use SocialInsightWeb, :controller
  plug Ueberauth

  import SocialInsightWeb.Router.Helpers
  alias Ueberauth.Strategy.Helpers
  alias SocialInsight.Facebook.FBUser

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user = auth
    |> FBUser.transform()
    |> UserSupervisor.get_or_create_user()

    conn
    |> put_flash(:info, "Logged in!")
    |> redirect(to: user_path(conn, :show, user.email))
  end
end
