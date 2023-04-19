defmodule Exmeal.Users.Delete do
  alias Exmeal.Helpers.GetMealOrUser
  alias Exmeal.Repo
  alias Exmeal.Users.Schema.User

  def call(id) do
    with {:ok, %User{} = user} <- GetMealOrUser.by_id(User, id) do
      Repo.delete(user)
    end
  end
end
