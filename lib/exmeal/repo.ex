defmodule Exmeal.Repo do
  use Ecto.Repo,
    otp_app: :exmeal,
    adapter: Ecto.Adapters.Postgres
end
