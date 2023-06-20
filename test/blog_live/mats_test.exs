defmodule BlogLive.MatsTest do
  use BlogLive.DataCase

  alias BlogLive.Mats

  describe "mats" do
    alias BlogLive.Mats.Mat

    import BlogLive.MatsFixtures

    @invalid_attrs %{name: nil, title: nil}

    test "list_mats/0 returns all mats" do
      mat = mat_fixture()
      assert Mats.list_mats() == [mat]
    end

    test "get_mat!/1 returns the mat with given id" do
      mat = mat_fixture()
      assert Mats.get_mat!(mat.id) == mat
    end

    test "create_mat/1 with valid data creates a mat" do
      valid_attrs = %{name: "some name", title: "some title"}

      assert {:ok, %Mat{} = mat} = Mats.create_mat(valid_attrs)
      assert mat.name == "some name"
      assert mat.title == "some title"
    end

    test "create_mat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mats.create_mat(@invalid_attrs)
    end

    test "update_mat/2 with valid data updates the mat" do
      mat = mat_fixture()
      update_attrs = %{name: "some updated name", title: "some updated title"}

      assert {:ok, %Mat{} = mat} = Mats.update_mat(mat, update_attrs)
      assert mat.name == "some updated name"
      assert mat.title == "some updated title"
    end

    test "update_mat/2 with invalid data returns error changeset" do
      mat = mat_fixture()
      assert {:error, %Ecto.Changeset{}} = Mats.update_mat(mat, @invalid_attrs)
      assert mat == Mats.get_mat!(mat.id)
    end

    test "delete_mat/1 deletes the mat" do
      mat = mat_fixture()
      assert {:ok, %Mat{}} = Mats.delete_mat(mat)
      assert_raise Ecto.NoResultsError, fn -> Mats.get_mat!(mat.id) end
    end

    test "change_mat/1 returns a mat changeset" do
      mat = mat_fixture()
      assert %Ecto.Changeset{} = Mats.change_mat(mat)
    end
  end
end
