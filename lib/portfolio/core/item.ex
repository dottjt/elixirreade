defmodule Portfolio.Core.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Portfolio.Core.Item
  alias Portfolio.Core.Project


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "items" do
    field :name, :string    
    field :display_name, :string
    field :excerpt, :string
    field :featured_image, :string

    # field :project_id, :binary_id
    belongs_to :project, Project

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :display_name, :featured_image, :excerpt])
    |> unique_constraint(:name)      
    |> validate_required([:name, :display_name, :featured_image, :excerpt])
  end
end
