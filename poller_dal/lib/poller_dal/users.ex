defmodule PollerDal.Users do
  import Ecto.Query
  alias PollerDal.Repo
  alias PollerDal.Users.User

  def create_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  def set_admin(%User{} = user, admin \\ true) do
    user
    |> User.admin_changeset(%{admin: admin})
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def list_users, do: Repo.all(User)

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by_email(email) do
    email = String.downcase(email)

    from(
      user in User,
      where: user.email == ^email
    )
    |> Repo.one()
  end

  def authenticate(email, password) do
    user = get_user_by_email(email)

    cond do
      user && Argon2.verify_pass(password, user.password_hash) ->
        {:ok, user}
      user ->
        {:error, :bad_password}
      true ->
        {:error, :bad_email}
    end
  end
end
