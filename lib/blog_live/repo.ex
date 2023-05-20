defmodule BlogLive.Repo do
  use Ecto.Repo,
    otp_app: :blog_live,
    adapter: Ecto.Adapters.Postgres
end
