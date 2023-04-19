defmodule Exmeal.Users.Schema.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Meals.Schema.Meal

  @email_regex ~r/^[A-Za-z0-9\._%+\-+']+@[A-Za-z0-9\.\-]+\.[A-Za-z]{2,4}$/

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:cpf, :email, :name]

  @derive {Jason.Encoder, only: [:cpf, :id, :email, :name]}

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, @email_regex)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end
end
