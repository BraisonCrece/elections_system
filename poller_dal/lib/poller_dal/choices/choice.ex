defmodule PollerDal.Choices.Choice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "choices" do
    field(:description, :string)
    field(:votes, :integer)
    field(:party, :string)
    belongs_to(:question, PollerDal.Questions.Question)

    timestamps()
  end

  def changeset(choice, attrs) do
    choice
    |> cast(attrs, [:description, :votes, :party, :question_id])
    |> validate_required([:description, :votes, :party, :question_id])
    |> assoc_constraint(:question)
  end
end
