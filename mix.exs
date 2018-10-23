defmodule Astarte.RPC.Mixfile do
  use Mix.Project

  def project do
    [
      app: :astarte_rpc,
      version: "0.10.0-beta.3",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/astarte-platform/astarte_rpc",
      homepage_url: "https://astarte-platform.org/"
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:amqp, "== 1.0.2"},
      {:exprotobuf, "== 1.2.9"},
      {:distillery, "== 1.5.2", runtime: false},
      {:conform, "== 2.5.2"},
      {:excoveralls, "== 0.9.1", only: :test}
    ]
  end

  defp description do
    """
    Astarte platform shared Protocol Buffers .proto files and Elixir AMQP client code.
    This component is one of the core components and basically is required to allow communication between different Astarte blocks.
    """
  end

  defp package do
    [
      maintainers: ["Davide Bettio", "Riccardo Binetti"],
      licenses: ["LGPL-3.0-or-later"],
      links: %{
        "Astarte" => "https://astarte-platform.org",
        "Ispirata" => "https://ispirata.com",
        "GitHub" => "https://github.com/astarte-platform/astarte_rpc"
      }
    ]
  end

end
