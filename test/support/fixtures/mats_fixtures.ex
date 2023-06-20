defmodule BlogLive.MatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BlogLive.Mats` context.
  """

  @doc """
  Generate a mat.
  """
  def mat_fixture(attrs \\ %{}) do
    {:ok, mat} =
      attrs
      |> Enum.into(%{
        name: "some name",
        title: "some title"
      })
      |> BlogLive.Mats.create_mat()

    mat
  end
end
