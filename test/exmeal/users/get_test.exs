defmodule Exmeal.Users.GetTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.User

  describe "Get User" do
    test "when a valid id is given, returns the user" do
      user_params = build(:users_params)

      {:ok, %User{id: id}} = Exmeal.create_user(user_params)

      response = Exmeal.get_user_by_id(id)

      assert {:ok,
              %Exmeal.User{
                cpf: "12345678900",
                email: "jp@banana.com",
                name: "Jp",
                id: ^id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.get_user_by_id(id)

      assert {:error, %Exmeal.Error{result: "User not found", status: :not_found}} = response
    end
  end
end
