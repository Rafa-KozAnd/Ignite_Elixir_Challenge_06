defmodule Exmeal.Meals.Schema.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.Users.Schema.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :date, :calories, :user_id]

  @derive {Jason.Encoder, only: [:id, :description, :date, :calories, :user_id]}

  schema "meals" do
    field :description, :string
    field :date, :utc_datetime
    field :calories, :integer

    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 3, max: 100)
  end
end
