defmodule BlogLive.Blogs.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field(:body, :string)
    field(:title, :string)
    field(:blog_image, {:array, :string} , default: [])
    belongs_to(:user, BlogLive.Users.User)

    timestamps()
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :body, :blog_image, :user_id])
    |> validate_required([:title, :body])
    |> unique_constraint(:title)
  end
end
