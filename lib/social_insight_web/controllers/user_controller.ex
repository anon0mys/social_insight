defmodule SocialInsightWeb.UserController do
  use SocialInsightWeb, :controller

  def show(conn, %{"email" => email}) do
    with %FBUser{} = user <- UserCache.get(email) do
      render(conn, "show.html", user: user)
    end
  end
end
