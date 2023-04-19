defmodule Exmeal.Meals.Update do
  alias Ecto.Changeset
  alias Exmeal.Helpers.{DateParse, GetMealOrUser}
  alias Exmeal.Meals.Schema.Meal
  alias Exmeal.Repo

  def call(%{"id" => id} = params) do
    with {:ok, %Meal{} = meal} <- GetMealOrUser.by_id(Meal, id),
         {:ok, params} <- DateParse.parse(params),
         %Changeset{valid?: true} = changeset <- Meal.changeset(meal, params) do
      Repo.update(changeset)
    end
  end
end
