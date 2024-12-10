defmodule SbomPocWeb.PagesController do
  use SbomPocWeb, :controller

  def sbom(conn, _params) do
    render(conn, "sbom.html", sbom_files: parse_files())
  end

  defp parse_files do
    files =
      :sbom_poc
      |> Application.app_dir("/priv/static/.well-known/sbom")
      |> File.ls!()

    Enum.reduce(["cyclonedx", "spdx", "vex"], %{}, fn filter, acc ->
      Map.put(acc, filter, filter_files(files, filter))
    end)
  end

  defp filter_files(files, filter) do
    regex = Regex.compile!(filter)
    files |> Enum.filter(fn file -> Regex.match?(regex, file) end)
  end
end
