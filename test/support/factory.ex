defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.{Meal, User}

  def meals_params_factory do
    %{
      description: "Banana",
      date: "2001-05-02",
      calories: "20",
      user_id: "388fccf4-f3bb-4822-9817-973a62158d20"
    }
  end

  def meal_factory do
    %Meal{
      description: "banana",
      date: "2001-05-02",
      calories: "2",
      user_id: "388fccf4-f3bb-4822-9817-973a62158d20",
      id: "69961117-d966-4e2f-ac55-476d4f78ddfa"
    }
  end

  def users_params_factory do
    %{
      name: "Jp",
      email: "jp@banana.com",
      cpf: "12345678900"
    }
  end

  def user_factory do
    %User{
      name: "Jp",
      email: "jp@banana.com",
      cpf: "12345678900",
      id: "69961117-d966-4e2f-ac55-476d4f78dddf"
    }
  end
end
