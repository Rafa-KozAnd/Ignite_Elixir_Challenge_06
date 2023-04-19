defmodule ExmealWeb.UsersView do
  use ExmealWeb, :view

  alias Exmeal.Users.Schema.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user
    }
  end

  def render("user.json", %{user: %User{} = user}), do: %{user: user}
end
