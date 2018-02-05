defmodule Portfolio.Core.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Portfolio.Core.Project


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "projects" do
    field :display_name, :string
    field :excerpt, :string
    field :featured_image, :string
    field :name, :string
    field :category_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:name, :display_name, :excerpt, :featured_image])
    |> validate_required([:name, :display_name, :excerpt, :featured_image])
  end
end
