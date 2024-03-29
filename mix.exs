defmodule Friends.MixProject do
  use Mix.Project

  def project do
    [
      app: :friends,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Friends.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto_cockroachdb, "~> 1.0"}
    ]
  end
end
