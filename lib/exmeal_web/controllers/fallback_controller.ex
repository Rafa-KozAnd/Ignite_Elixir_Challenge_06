defmodule ExmealWeb.FallbackController do
  use ExmealWeb, :controller

  alias Exmeal.Error
  alias ExmealWeb.ErrorView

  def call(conn, {:error, %Error{error: error, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", error: error)
  end
end
