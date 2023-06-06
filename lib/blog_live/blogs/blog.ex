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

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :body, :blog_image, :user_id])
    |> validate_required([:title, :body])
    |> unique_constraint(:title)
  end
end
