defmodule SocialInsight.Users.UserSupervisor do
  use DynamicSupervisor
  alias SocialInsight.Users.UserCache

  def start_link(arg) do
    DynamicSupervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def get_or_create_user(user) do
    case DynamicSupervisor.start_child(__MODULE__, {UserCache, user}) do
      {:ok, pid} -> pid
      {:error, {:already_started, pid}} -> pid
    end
  end

  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
