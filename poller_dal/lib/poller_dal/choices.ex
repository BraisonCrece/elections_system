defmodule PollerDal.Choices do
  import Ecto.Query
  alias PollerDal.Repo
  alias PollerDal.Choices.Choice

  def list_choices_by_question_id(question_id) do
    from(
      choice in Choice,
      where: choice.question_id == ^question_id
    )
    |> Repo.all()
  end

  def create_choice(attrs) do
    %Choice{}
    |> Choice.changeset(attrs)
    |> Repo.insert()
  end

  def update_choice(%Choice{} = choice, attrs) do
    choice
    |> Choice.changeset(attrs)
    |> Repo.update()
  end

  def delete_choice(%Choice{} = choice) do
    Repo.delete(choice)
  end

  def list_choices, do: Repo.all(Choice)

  def get_choice!(id), do: Repo.get!(Choice, id)
end
