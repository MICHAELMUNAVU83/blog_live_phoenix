defmodule BlogLive.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add(:title, :string)
      add(:body, :text)
      add(:blog_image, :string)
      add(:user_id, references(:users, on_delete: :delete_all), null: false)

      timestamps()
    end

    create(unique_index(:blogs, [:title]))
  end
end
