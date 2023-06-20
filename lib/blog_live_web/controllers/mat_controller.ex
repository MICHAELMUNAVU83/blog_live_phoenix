defmodule BlogLiveWeb.MatController do
  use BlogLiveWeb, :controller

  alias BlogLive.Mats
  alias BlogLive.Mats.Mat

  def index(conn, _params) do
    mats = Mats.list_mats()
    render(conn, "index.html", mats: mats)
  end

  def new(conn, _params) do
    changeset = Mats.change_mat(%Mat{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mat" => mat_params}) do
    case Mats.create_mat(mat_params) do
      {:ok, mat} ->
        conn
        |> put_flash(:info, "Mat created successfully.")
        |> redirect(to: Routes.mat_path(conn, :show, mat))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mat = Mats.get_mat!(id)
    render(conn, "show.html", mat: mat)
  end

  def edit(conn, %{"id" => id}) do
    mat = Mats.get_mat!(id)
    changeset = Mats.change_mat(mat)
    render(conn, "edit.html", mat: mat, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mat" => mat_params}) do
    mat = Mats.get_mat!(id)

    case Mats.update_mat(mat, mat_params) do
      {:ok, mat} ->
        conn
        |> put_flash(:info, "Mat updated successfully.")
        |> redirect(to: Routes.mat_path(conn, :show, mat))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", mat: mat, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mat = Mats.get_mat!(id)
    {:ok, _mat} = Mats.delete_mat(mat)

    conn
    |> put_flash(:info, "Mat deleted successfully.")
    |> redirect(to: Routes.mat_path(conn, :index))
  end
end
