defmodule SocialInsightWeb.Router do
  use SocialInsightWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", SocialInsightWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
    post "/logout", AuthController, :delete
  end

  scope "/", SocialInsightWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/users/:email", UserController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", SocialInsightWeb do
  #   pipe_through :api
  # end
end
