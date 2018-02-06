defmodule Portfolio.Core.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Portfolio.Core.Tag


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tags" do
    field :display_name, :string
    field :excerpt, :string
    field :featured_image, :string
    field :name, :string

    # field :item_id, :binary_id
    # field :project_id, :binary_id
    
    belongs_to :item, Item # this might potentially be incorrect, might need to be many_to_many
    belongs_to :project, Project # this might potentially be incorrect, might need to be many_to_many

    timestamps()
  end

  @doc false
  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:name, :display_name, :featured_image, :excerpt])
    |> validate_required([:name, :display_name, :featured_image, :excerpt])
  end
end
