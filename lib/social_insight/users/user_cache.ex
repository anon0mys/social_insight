defmodule SocialInsight.Users.UserCache do
  use GenServer

  def start_link(%{email: email} = user) when is_binary(email) do
    GenServer.start_link(__MODULE__, user, [name: :"#{email}"])
  end

  @impl true
  def init(user) do
    {:ok, user}
  end
end
