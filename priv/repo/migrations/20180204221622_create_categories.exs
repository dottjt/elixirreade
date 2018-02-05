defmodule Portfolio.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :display_name, :string
      add :excerpt, :string
      add :featured_image, :string

      timestamps()
    end

  end
end
