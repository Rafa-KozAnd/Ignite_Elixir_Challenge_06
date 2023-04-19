defmodule ExmealWeb.UsersController do
  use ExmealWeb, :controller

  alias Exmeal.Users.Schema.User
  alias ExmealWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Exmeal.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Exmeal.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Exmeal.get_user_by_id(User, id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Exmeal.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
