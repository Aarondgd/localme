defmodule LocalmeWeb.Router do
  use LocalmeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LocalmeWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/new", AppointmentController, :new
    post "/create", AppointmentController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", LocalmeWeb do
  #   pipe_through :api
  # end
end
