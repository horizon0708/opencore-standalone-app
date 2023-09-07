defmodule StandaloneAppWeb.PageController do
  use StandaloneAppWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def show(conn, %{"slug" => slug}) do
    conn
    |> assign(:slug, slug)
    |> render(:show, layout: false)
  end
end
