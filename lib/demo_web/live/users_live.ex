defmodule DemoWeb.UsersLive do
  use DemoWeb, :live_view

  @cats %{1 => ["Jack", "John"], 2 => ["Tom", "Jerry"], 3 => ["Luke", "Tom"]}

  def handle_event("show_next", _value, socket) do
    uuid = Ecto.UUID.generate

    {:noreply, assign(socket, :uuid, uuid)}
  end

  def handle_params(%{"page" => page}, _, socket) do
    {page, _} = Integer.parse(page)
    cats_on_page = Map.get(@cats, page)

    {:noreply, assign(socket, cats: cats_on_page, page: page)}
  end
end
