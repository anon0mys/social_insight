defmodule SocialInsight.Facebook.FBUser do
  @moduledoc """
  """

  defstruct description: nil,
    email: nil,
    first_name: nil,
    image: nil,
    last_name: nil,
    location: nil,
    name: nil,
    nickname: nil,
    phone: nil,
    urls: %{},
    token: nil

  @type t :: %__Module__{
    description: String.t(),
    email: String.t(),
    first_name: String.t(),
    last_name: String.t(),
    image: String.t(),
    location: String.t(),
    name: String.t(),
    nickname: String.t(),
    phone: String.t(),
    urls: map,
    token: String.t()
  }
end
