defmodule Portfolio.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :display_name, :string
      add :featured_image, :string
      add :excerpt, :string
      add :project_id, references(:projects, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:items, [:project_id])
  end
end
