defmodule StandaloneAppWeb.Plugs.GetBlog do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    blogs = Application.get_env(:standalone_app, :blogs)

    conn
    |> assign(:blog, blogs.get_current_blog(conn.host))
  end
end
