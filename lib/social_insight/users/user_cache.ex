defmodule SocialInsight.Users.UserCache do
  use GenServer

  def start_link(%{email: email} = user) when is_binary(email) do
    GenServer.start_link(__MODULE__, user, [name: :"#{email}"])
  end

  @impl true
  def init(user) do
    {:ok, user}
  end

  def get(email) do
    GenServer.call(:"#{email}", :get)
  end
  #
  # def update(%{email: email} = user) do
  #   Genserver.call(:"#{email}", {:update, user})
  # end

  @impl true
  def handle_call(:get, _, user) do
    {:reply, user, user}
  end

  # @impl true
  # def handle_call({:update, new_user}, _, user) do
  #   user = user
  #   |> FBUser.update()
  #
  #   {:reply, user, user}
  # end
end
