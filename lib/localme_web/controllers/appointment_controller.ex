defmodule LocalmeWeb.AppointmentController do
  use LocalmeWeb, :controller

  alias Localme.Appointments

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"appointment" => appointment_params})do
    case Appointments.create_appointment(appointment_params) do
      {:ok, _appointment} ->
        conn
        |> put_flash(:info, "Se creo la cita")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "new.html", changeset: changeset)
    end
  end
end
