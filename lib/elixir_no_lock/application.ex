defmodule ElixirNoLock.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    port = String.to_integer(System.get_env("PORT") || "4000")

    children = [
      {Plug.Cowboy,
       scheme: :http, plug: ElixirNoLock.Router, options: [port: port, ip: {0, 0, 0, 0}]}
    ]

    require Logger
    Logger.info("elixir-no-lock listening on 0.0.0.0:#{port}")

    opts = [strategy: :one_for_one, name: ElixirNoLock.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
