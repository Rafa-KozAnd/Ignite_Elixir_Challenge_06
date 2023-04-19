defmodule Exmeal.Users.Update do
  alias Ecto.Changeset
  alias Exmeal.Helpers.GetMealOrUser
  alias Exmeal.Repo
  alias Exmeal.Users.Schema.User

  def call(%{"id" => id} = params) do
    with {:ok, %User{} = user} <- GetMealOrUser.by_id(User, id),
         %Changeset{valid?: true} = changeset <- User.changeset(user, params) do
      Repo.update(changeset)
    end
  end
end
