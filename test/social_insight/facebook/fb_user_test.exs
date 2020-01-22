defmodule SocialInsight.FBUserTest do
  use ExUnit.Case

  alias SocialInsight.Facebook.FBUser

  test "translates Facebook API response into a user struct" do
    user = fb_data() |> FBUser.transform()
    assert user.uid
    assert user.description
    assert user.email
    assert user.first_name
    assert user.image
    assert user.last_name
    assert user.location
    assert user.name
    assert user.nickname
    assert user.phone
    assert user.urls
    assert user.token
    assert user.refresh_token
    assert user.expires_at
  end

  def fb_data do
    %Ueberauth.Auth{
      credentials: %Ueberauth.Auth.Credentials{
        expires: true,
        expires_at: 1578890340,
        other: %{},
        refresh_token: "nice-refresh-token",
        scopes: [""],
        secret: nil,
        token: "sweet-token-string",
        token_type: nil
      },
      extra: %Ueberauth.Auth.Extra{
        raw_info: %{
          token: %OAuth2.AccessToken{
            access_token: "nested-sweet-token-string",
            expires_at: 1578890340,
            other_params: %{},
            refresh_token: "nested-nice-refresh-token",
            token_type: "Bearer"
          },
          user: %{
            "email" => "some@email.com",
            "id" => "12346789",
            "name" => "Jeffrey Lebowski"
          }
        }
      },
      info: %Ueberauth.Auth.Info{
        description: "Dude just wanted his rug back",
        email: "some@email.com",
        first_name: "Jeffrey",
        image: "https://graph.facebook.com/user-id/picture?type=square",
        last_name: "Lebowski",
        location: "Las Angeles, CA",
        name: "Jeffrey Lebowski",
        nickname: "The Dude",
        phone: "123-456-7890",
        urls: %{facebook: nil, website: nil}
      },
      provider: :facebook,
      strategy: Ueberauth.Strategy.Facebook,
      uid: "12346789"
    }
  end
end
