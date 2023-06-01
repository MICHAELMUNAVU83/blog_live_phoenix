defmodule BlogLive.Blogs.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field(:body, :string)
    field(:title, :string)
    field(:blog_image, :string)

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :body, :blog_image])
    |> validate_required([:title, :body])
    |> unique_constraint(:title)
  end
end
