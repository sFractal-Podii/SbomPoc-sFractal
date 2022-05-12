defmodule SbomPocWeb.PagesController do
  use SbomPocWeb, :controller

  def sbom(conn, _params) do
    render(conn, "sbom.html")
  end
end
