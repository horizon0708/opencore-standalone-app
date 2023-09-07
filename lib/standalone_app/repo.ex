defmodule StandaloneApp.Repo do
  use Ecto.Repo,
    otp_app: :standalone_app,
    adapter: Ecto.Adapters.Postgres
end
