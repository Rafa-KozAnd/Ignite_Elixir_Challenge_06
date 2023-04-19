ExUnit.configure formatters: [ExUnit.CLIFormatter, JsonResponse]
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Exmeal.Repo, :manual)
