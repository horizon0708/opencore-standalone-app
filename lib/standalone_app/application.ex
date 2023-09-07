defmodule StandaloneApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      StandaloneAppWeb.Telemetry,
      # Start the Ecto repository
      StandaloneApp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: StandaloneApp.PubSub},
      # Start Finch
      {Finch, name: StandaloneApp.Finch},
      # Start the Endpoint (http/https)
      StandaloneAppWeb.Endpoint
      # Start a worker by calling: StandaloneApp.Worker.start_link(arg)
      # {StandaloneApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StandaloneApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StandaloneAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
