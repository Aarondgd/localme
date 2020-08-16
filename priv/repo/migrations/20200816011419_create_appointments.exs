defmodule Localme.Repo.Migrations.CreateAppointments do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add :title, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end
