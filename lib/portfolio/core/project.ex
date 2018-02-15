defmodule Portfolio.Core.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Portfolio.Core.Project
  alias Portfolio.Core.Category
  alias Portfolio.Core.Item
  alias Portfolio.Core.Tag


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "projects" do
    field :name, :string    
    field :display_name, :string
    field :excerpt, :string
    field :description, :string
    field :featured_image, :string
    field :background_image, :string
    field :link, :string

    field :start_date, :naive_datetime
    field :end_date, :naive_datetime
    
    # field :category_id, :binary_id
    belongs_to :category, Category
    has_many :items, Item 
    has_many :tags, Tag

    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:name, :display_name, :description, :excerpt, :featured_image, :background_image, :link, :start_date, :end_date])
    |> unique_constraint(:name)      
    |> validate_required([:name, :display_name, :description, :excerpt, :featured_image, :background_image, :link, :start_date, :end_date])
  end
end
