defmodule Vemosla.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Vemosla.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Vemosla.PubSub}
      # Start a worker by calling: Vemosla.Worker.start_link(arg)
      # {Vemosla.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Vemosla.Supervisor)
  end
end
