defmodule SocialInsight.Users.UserCache do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(arg) do
    {:ok, arg}
  end
end
