defmodule BlogLive.Mats do
  @moduledoc """
  The Mats context.
  """

  import Ecto.Query, warn: false
  alias BlogLive.Repo

  alias BlogLive.Mats.Mat

  @doc """
  Returns the list of mats.

  ## Examples

      iex> list_mats()
      [%Mat{}, ...]

  """
  def list_mats do
    Repo.all(Mat)
  end

  @doc """
  Gets a single mat.

  Raises `Ecto.NoResultsError` if the Mat does not exist.

  ## Examples

      iex> get_mat!(123)
      %Mat{}

      iex> get_mat!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mat!(id), do: Repo.get!(Mat, id)

  @doc """
  Creates a mat.

  ## Examples

      iex> create_mat(%{field: value})
      {:ok, %Mat{}}

      iex> create_mat(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mat(attrs \\ %{}) do
    %Mat{}
    |> Mat.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mat.

  ## Examples

      iex> update_mat(mat, %{field: new_value})
      {:ok, %Mat{}}

      iex> update_mat(mat, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mat(%Mat{} = mat, attrs) do
    mat
    |> Mat.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mat.

  ## Examples

      iex> delete_mat(mat)
      {:ok, %Mat{}}

      iex> delete_mat(mat)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mat(%Mat{} = mat) do
    Repo.delete(mat)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mat changes.

  ## Examples

      iex> change_mat(mat)
      %Ecto.Changeset{data: %Mat{}}

  """
  def change_mat(%Mat{} = mat, attrs \\ %{}) do
    Mat.changeset(mat, attrs)
  end
end
