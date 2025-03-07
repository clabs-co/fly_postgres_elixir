defmodule FlyPostgres.MixProject do
  use Mix.Project

  def project do
    [
      app: :fly_postgres,
      version: "0.3.1",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      name: "Fly Postgres",
      source_url: "https://github.com/superfly/fly_postgres_elixir",
      description: description(),
      deps: deps(),
      package: package(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:fly_rpc, "~> 0.2.0"},
      {:ecto_sql, ">= 3.4.0"},
      {:postgrex, ">= 0.0.0"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:sobelow, "~> 0.8", only: [:dev, :test]},
      {:telemetry, "~> 0.4.3"},
      {:ex_doc, "~> 0.25", only: :dev}
    ]
  end

  defp description do
    """
    Library for working with local read-replica Postgres databases and performing writes through RPC calls to other nodes in the primary Fly.io region.
    """
  end

  defp docs do
    [
      main: "readme",
      # logo: "path/to/logo.png",
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      maintainers: ["Mark Ericksen"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/superfly/fly_postgres_elixir"}
    ]
  end
end
