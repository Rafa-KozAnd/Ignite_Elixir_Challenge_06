defmodule Exmeal.UserTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:users_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 cpf: "12345678900",
                 name: "Jp",
                 email: "jp@banana.com"
               },
               valid?: true
             } = response
    end
  end
end
