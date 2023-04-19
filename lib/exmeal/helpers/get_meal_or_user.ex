defmodule Exmeal.Helpers.GetMealOrUser do
  alias Exmeal.{Error, Repo}

  def by_id(struct, id) do
    case Repo.get(struct, id) do
      %_stuct{} = user_or_meal -> {:ok, user_or_meal}
      nil -> {:error, Error.error_not_found(struct)}
    end
  end
end
