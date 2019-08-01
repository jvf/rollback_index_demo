defmodule Friends.Repo.Migrations.AddIndexToPeople do
  use Ecto.Migration

  def change do
    create(index(:people, [:first_name]))
  end
end
