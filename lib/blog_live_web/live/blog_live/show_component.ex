defmodule BlogLiveWeb.BlogLive.ShowComponent do
  use BlogLiveWeb, :live_component

  alias BlogLive.Blogs

  def render(assigns) do
    ~H"""
    <div>
      <div id="myModal" class="modal">
        <div class="modal-content">
          <div>
            <%= @blog.title %>
            z
          <!-- Add your content here -->
          </div>
        </div>
      </div>
    </div>
    """
  end

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end
end
