defmodule Localme.Repo do
  use Ecto.Repo,
    otp_app: :localme,
    adapter: Ecto.Adapters.Postgres
end
