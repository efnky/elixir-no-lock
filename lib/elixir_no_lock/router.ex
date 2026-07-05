defmodule ElixirNoLock.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "elixir-no-lock (mix.lock YOK, deps pinlenmemiş)")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
