defmodule BlogLive.Repo.Migrations.CreateMats do
  use Ecto.Migration

  def change do
    create table(:mats) do
      add :name, :string
      add :title, :string

      timestamps()
    end
  end
end
