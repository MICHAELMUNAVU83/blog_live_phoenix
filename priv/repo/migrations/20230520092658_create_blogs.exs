defmodule BlogLive.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :body, :text

      timestamps()
    end

    create unique_index(:blogs, [:title])
  end
end
