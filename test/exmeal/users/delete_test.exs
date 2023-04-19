defmodule Exmeal.Users.DeleteTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.User

  describe "Delete user" do
    test "when a valid id is given, returns the user" do
      params = build(:users_params)

      {:ok, %User{id: id}} = Exmeal.create_user(params)

      response = Exmeal.delete_user(id)

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
      response = Exmeal.delete_user(id)

      assert {:error, %Exmeal.Error{result: "User not found", status: :not_found}} = response
    end
  end
end
