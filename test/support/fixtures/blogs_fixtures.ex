defmodule BlogLive.BlogsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogLive.Blogs` context.
  """

  @doc """
  Generate a blog.
  """
  def blog_fixture(attrs \\ %{}) do
    {:ok, blog} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> BlogLive.Blogs.create_blog()

    blog
  end
end
