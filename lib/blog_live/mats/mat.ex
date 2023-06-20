defmodule BlogLive.Mats.Mat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mats" do
    field :name, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(mat, attrs) do
    mat
    |> cast(attrs, [:name, :title])
    |> validate_required([:name, :title])
  end
end
