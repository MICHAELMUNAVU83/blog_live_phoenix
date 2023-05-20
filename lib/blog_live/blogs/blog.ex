defmodule BlogLive.Blogs.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
