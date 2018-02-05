defmodule Portfolio.Core.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias Portfolio.Core.Category


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :display_name, :string
    field :excerpt, :string
    field :featured_image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:name, :display_name, :excerpt, :featured_image])
    |> validate_required([:name, :display_name, :excerpt, :featured_image])
  end
end
