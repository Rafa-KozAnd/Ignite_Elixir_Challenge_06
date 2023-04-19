defmodule Exmeal.Helpers.DateParse do
  alias Exmeal.Error

  def parse(%{"date" => date, "time" => time} = params) do
    with {:ok, date} <- Date.from_iso8601(date),
         {:ok, time} <- Time.from_iso8601(time) do
      DateTime.new!(date, time)
      |> put_new_date(params)
    else
      {:error, _} -> {:error, Error.error_date_or_time()}
    end
  end

  def parse(%{} = params), do: {:ok, params}

  defp put_new_date(new_date, params) do
    params =
      params
      |> Map.put("date", new_date)
      |> Map.delete("time")

    {:ok, params}
  end
end
