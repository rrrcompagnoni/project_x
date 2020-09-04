defmodule ProjectX.MixProject do
  use Mix.Project

  def project do
    [
      app: :project_x,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ProjectX.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:crawly, "~> 0.1"},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:floki, "~> 0.26.0"},
      {:jason, "~> 1.2"},
      {:timex, "~> 3.5"}
    ]
  end

  defp aliases do
    [linter: "credo"]
  end
end
