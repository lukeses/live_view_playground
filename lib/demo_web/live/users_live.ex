defmodule DemoWeb.UsersLive do
  use DemoWeb, :live_view

  def mount(_params, %{}, socket) do
    uuid = Ecto.UUID.generate
    {:ok, assign(socket, uuid: uuid)}
  end

  def handle_event("show_next", _value, socket) do
    uuid = Ecto.UUID.generate

    {:noreply, assign(socket, :uuid, uuid)}
  end

end
