defmodule Exmeal.Meals.Delete do
  alias Exmeal.Helpers.GetMealOrUser
  alias Exmeal.Meals.Schema.Meal
  alias Exmeal.Repo

  def call(id) do
    with {:ok, %Meal{} = meal} <- GetMealOrUser.by_id(Meal, id) do
      Repo.delete(meal)
    end
  end
end
