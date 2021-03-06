defmodule Nerves.InterimWiFi.Mixfile do
  use Mix.Project

  def project do
    [app: :nerves_interim_wifi,
     version: "0.2.1-dev",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     compilers: [:elixir_make] ++ Mix.compilers,
     make_clean: ["clean"],
     deps: deps(),
     docs: [extras: ["README.md"]],
     package: package(),
     description: description()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger],
     mod: {Nerves.InterimWiFi.Application, []}]
  end

  defp description do
    """
    Manage WiFi network connections.
    """
  end

  defp package do
    %{files: ["lib", "src/*.[ch]", "test", "mix.exs", "README.md", "LICENSE", "CHANGELOG.md", "Makefile"],
      maintainers: ["Frank Hunleth"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/nerves-project/nerves_interim_wifi"}}
  end

  defp deps do
    [
      {:elixir_make, "~> 0.3"},
      {:ex_doc, "~> 0.11", only: :dev},
      {:nerves_network_interface, "~> 0.4.0"},
      {:nerves_wpa_supplicant, "~> 0.3.0"}
    ]
  end
end
