defmodule Localme.Appointments.Appointment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "appointments" do
    field :end_date, :utc_datetime
    field :start_date, :utc_datetime
    field :status, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(appointment, attrs) do
    appointment
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
