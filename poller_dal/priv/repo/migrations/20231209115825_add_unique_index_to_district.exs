defmodule PollerDal.Repo.Migrations.AddUniqueIndexToDistrict do
  use Ecto.Migration

  def change do
    create unique_index(:districts, [:name])
  end
end
