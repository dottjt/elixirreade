defmodule Portfolio.Core.Category do
  use Ecto.Schema
  import Ecto.Changeset
  alias Portfolio.Core.Category
  alias Portfolio.Core.Project


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :name, :string    
    field :display_name, :string
    field :description, :string

    has_many :projects, Project

    timestamps()
  end

  @doc false
  def changeset(%Category{} = category, attrs) do
    category
    |> cast(attrs, [:name, :display_name, :description])
    |> unique_constraint(:name)      
    |> validate_required([:name, :display_name, :description])
  end
end
