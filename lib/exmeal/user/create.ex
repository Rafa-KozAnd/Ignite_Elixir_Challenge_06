defmodule Exmeal.Users.Create do
  alias Exmeal.Error
  alias Exmeal.Repo
  alias Exmeal.Users.Schema.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> hendle_insert()
  end

  defp hendle_insert({:ok, %User{}} = new_user), do: new_user

  defp hendle_insert({:error, description_error}) do
    {:error, Error.build(:bad_request, description_error)}
  end
end
