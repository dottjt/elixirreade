defmodule Portfolio.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :display_name, :string
      add :excerpt, :string
      add :featured_image, :string
      add :category_id, references(:categories, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:projects, [:category_id])
  end
end
