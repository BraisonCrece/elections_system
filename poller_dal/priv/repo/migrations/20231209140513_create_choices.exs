defmodule PollerDal.Repo.Migrations.CreateChoices do
  use Ecto.Migration

  def change do
    create table(:choices) do
      add(:description, :string)
      add(:votes, :integer)
      add(:party, :string)
      add(:question_id, references(:questions, on_delete: :delete_all))

      timestamps()
    end

    create index(:choices, [:question_id])
  end
end
