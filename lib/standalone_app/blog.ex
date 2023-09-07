defmodule StandaloneApp.Blog do
  def get_current_blog(_),
    do: %{
      id: nil,
      name: "Self hosted"
    }
end
