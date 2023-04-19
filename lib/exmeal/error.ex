defmodule Exmeal.Error do
  alias Exmeal.Meals.Schema.Meal
  alias Exmeal.Users.Schema.User

  @keys [:status, :error]
  @enforce_keys @keys

  defstruct @keys

  def build(status, descripition_error) do
    %__MODULE__{
      status: status,
      error: descripition_error
    }
  end

  def error_date_or_time, do: build(:bad_request, "Invalid date or time format")
  def error_user_id_invalid, do: build(:bad_request, "Invalid user_id")
  def error_not_found(User), do: build(:not_found, "User not found")
  def error_not_found(Meal), do: build(:not_found, "Meal not found")
  def error_changeset(changeset), do: build(:bad_request, changeset)
end
