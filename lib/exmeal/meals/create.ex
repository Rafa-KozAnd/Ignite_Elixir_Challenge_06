defmodule Exmeal.Meals.Create do
  alias Ecto.Changeset
  alias Exmeal.{Error, Repo}
  alias Exmeal.Helpers.{DateParse, GetMealOrUser}
  alias Exmeal.Meals.Schema.Meal
  alias Exmeal.Users.Schema.User

  def call(%{"user_id" => id} = params) do
    with {:ok, user_id} <- Ecto.UUID.cast(id),
         {:ok, %User{} = user} <- GetMealOrUser.by_id(User, user_id),
         {:ok, parse_params} <- DateParse.parse(params),
         %Changeset{changes: changes, valid?: true} <- Meal.changeset(parse_params) do
      user
      |> Ecto.build_assoc(:meals, changes)
      |> Repo.insert()
      |> hendle_insert()
    else
      :error -> {:error, Error.error_user_id_invalid()}
      {:error, %Error{}} = result -> result
      %Changeset{valid?: false} = changeset -> {:error, Error.build(:bad_request, changeset)}
    end
  end

  defp hendle_insert({:ok, %Meal{}} = new_meal), do: new_meal

  defp hendle_insert({:error, description_error}) do
    {:error, Error.build(:bad_request, description_error)}
  end
end
