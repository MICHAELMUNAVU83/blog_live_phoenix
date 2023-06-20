defmodule BlogLiveWeb.MatControllerTest do
  use BlogLiveWeb.ConnCase

  import BlogLive.MatsFixtures

  @create_attrs %{name: "some name", title: "some title"}
  @update_attrs %{name: "some updated name", title: "some updated title"}
  @invalid_attrs %{name: nil, title: nil}

  describe "index" do
    test "lists all mats", %{conn: conn} do
      conn = get(conn, Routes.mat_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Mats"
    end
  end

  describe "new mat" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.mat_path(conn, :new))
      assert html_response(conn, 200) =~ "New Mat"
    end
  end

  describe "create mat" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.mat_path(conn, :create), mat: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.mat_path(conn, :show, id)

      conn = get(conn, Routes.mat_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Mat"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.mat_path(conn, :create), mat: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Mat"
    end
  end

  describe "edit mat" do
    setup [:create_mat]

    test "renders form for editing chosen mat", %{conn: conn, mat: mat} do
      conn = get(conn, Routes.mat_path(conn, :edit, mat))
      assert html_response(conn, 200) =~ "Edit Mat"
    end
  end

  describe "update mat" do
    setup [:create_mat]

    test "redirects when data is valid", %{conn: conn, mat: mat} do
      conn = put(conn, Routes.mat_path(conn, :update, mat), mat: @update_attrs)
      assert redirected_to(conn) == Routes.mat_path(conn, :show, mat)

      conn = get(conn, Routes.mat_path(conn, :show, mat))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, mat: mat} do
      conn = put(conn, Routes.mat_path(conn, :update, mat), mat: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Mat"
    end
  end

  describe "delete mat" do
    setup [:create_mat]

    test "deletes chosen mat", %{conn: conn, mat: mat} do
      conn = delete(conn, Routes.mat_path(conn, :delete, mat))
      assert redirected_to(conn) == Routes.mat_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.mat_path(conn, :show, mat))
      end
    end
  end

  defp create_mat(_) do
    mat = mat_fixture()
    %{mat: mat}
  end
end
