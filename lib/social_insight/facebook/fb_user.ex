defmodule SocialInsight.Facebook.FBUser do
  @moduledoc """
  A struct that represents a facebook user
  """

  defstruct uid: nil,
            description: nil,
            email: nil,
            first_name: nil,
            image: nil,
            last_name: nil,
            location: nil,
            name: nil,
            nickname: nil,
            phone: nil,
            urls: %{},
            token: nil,
            refresh_token: nil,
            expires_at: nil

  alias SocialInsight.Facebook.FBUser
  alias Ueberauth.Auth

  @type t :: %FBUser{
    uid: integer(),
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
    token: String.t(),
    refresh_token: String.t(),
    expires_at: integer()
  }

  def transform(%Auth{credentials: credentials, info: info, uid: uid} = response) do
    %FBUser{uid: uid}
    |> update_credentials(credentials)
    |> update_info(info)
  end

  def update_credentials(user, %Auth.Credentials{} = credentials) do
    %FBUser{user |
      token: credentials.token,
      refresh_token: credentials.refresh_token,
      expires_at: credentials.expires_at
    }
  end

  def update_info(user, %Auth.Info{} = info) do
    %FBUser{user |
      description: info.description,
      email: info.email,
      first_name: info.first_name,
      last_name: info.last_name,
      image: info.image,
      location: info.location,
      name: info.name,
      nickname: info.nickname,
      phone: info.phone,
      urls: info.urls
    }
  end
end
