defmodule Localme.AgendaTest do
  use Localme.DataCase

  alias Localme.Agenda

  describe "appointments" do
    alias Localme.Agenda.Appointment

    @valid_attrs %{end_date: "2010-04-17T14:00:00Z", start_date: "2010-04-17T14:00:00Z", status: true, title: "some title"}
    @update_attrs %{end_date: "2011-05-18T15:01:01Z", start_date: "2011-05-18T15:01:01Z", status: false, title: "some updated title"}
    @invalid_attrs %{end_date: nil, start_date: nil, status: nil, title: nil}

    def appointment_fixture(attrs \\ %{}) do
      {:ok, appointment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Agenda.create_appointment()

      appointment
    end

    test "list_appointments/0 returns all appointments" do
      appointment = appointment_fixture()
      assert Agenda.list_appointments() == [appointment]
    end

    test "get_appointment!/1 returns the appointment with given id" do
      appointment = appointment_fixture()
      assert Agenda.get_appointment!(appointment.id) == appointment
    end

    test "create_appointment/1 with valid data creates a appointment" do
      assert {:ok, %Appointment{} = appointment} = Agenda.create_appointment(@valid_attrs)
      assert appointment.end_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert appointment.start_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert appointment.status == true
      assert appointment.title == "some title"
    end

    test "create_appointment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Agenda.create_appointment(@invalid_attrs)
    end

    test "update_appointment/2 with valid data updates the appointment" do
      appointment = appointment_fixture()
      assert {:ok, %Appointment{} = appointment} = Agenda.update_appointment(appointment, @update_attrs)
      assert appointment.end_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert appointment.start_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert appointment.status == false
      assert appointment.title == "some updated title"
    end

    test "update_appointment/2 with invalid data returns error changeset" do
      appointment = appointment_fixture()
      assert {:error, %Ecto.Changeset{}} = Agenda.update_appointment(appointment, @invalid_attrs)
      assert appointment == Agenda.get_appointment!(appointment.id)
    end

    test "delete_appointment/1 deletes the appointment" do
      appointment = appointment_fixture()
      assert {:ok, %Appointment{}} = Agenda.delete_appointment(appointment)
      assert_raise Ecto.NoResultsError, fn -> Agenda.get_appointment!(appointment.id) end
    end

    test "change_appointment/1 returns a appointment changeset" do
      appointment = appointment_fixture()
      assert %Ecto.Changeset{} = Agenda.change_appointment(appointment)
    end
  end
end
