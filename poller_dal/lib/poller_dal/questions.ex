defmodule PollerDal.Questions do
  import Ecto.Query
  alias PollerDal.Repo
  alias PollerDal.Questions.Question

  def list_questions_by_district_id(district_id) do
    from(
      question in Question,
      where: question.district_id == ^district_id
    )
    |> Repo.all()
  end

  def create_question(attrs) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  def list_questions, do: Repo.all(Question)

  def get_question!(id), do: Repo.get!(Question, id)
end
