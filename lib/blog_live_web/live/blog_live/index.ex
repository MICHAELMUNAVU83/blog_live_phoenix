defmodule BlogLiveWeb.BlogLive.Index do
  use BlogLiveWeb, :live_view

  alias BlogLive.Blogs
  alias BlogLive.Blogs.Blog
  alias BlogLive.Accounts

  @impl true
  def mount(_params, session, socket) do
    user =
      Accounts.get_user_by_session_token(session["user_token"])
      |> IO.inspect(label: "user in mount")

    {:ok, socket |> assign(:user, user) |> assign(:blogs, list_blogs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Blog")
    |> assign(:blog, Blogs.get_blog!(id))
  end

  defp apply_action(socket, :new, _params) do
    IO.inspect(socket.assigns.user.id)

    socket
    |> assign(:page_title, "New Blog")
    |> assign(:blog, %Blog{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Blogs")
    |> assign(:blog, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    blog = Blogs.get_blog!(id)
    {:ok, _} = Blogs.delete_blog(blog)

    {:noreply, assign(socket, :blogs, list_blogs())}
  end

  defp list_blogs do
    Blogs.list_blogs()
  end
end
