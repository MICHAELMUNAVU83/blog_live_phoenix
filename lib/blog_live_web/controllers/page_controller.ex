defmodule BlogLiveWeb.PageController do
  use BlogLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
