defmodule LocalmeWeb.PageController do
  use LocalmeWeb, :controller

  alias Localme.Appointments

  def index(conn, _params) do
    appointments = Appointments.list_appointments

    render(conn, "index.html", appointments: appointments)
  end
end
