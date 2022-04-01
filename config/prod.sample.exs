# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

# database_url = "ecto://user:password@ipaddress/db_name"
database_url = "ecto://postgres:5Hpk62rz66CG7uNi@34.145.224.110/sbompoc"

config :sbom_poc, SbomPoc.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base = "5zdHG99HtmYTlFftbHxmF1AYpxC/mH4zd9uIAegWwE80CiD6Cnf+H3OW/P/Jc0EL"

config :sbom_poc, SbomPocWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000"),
    transport_options: [socket_opts: [:inet6]]
  ],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
config :sbom_poc, SbomPocWeb.Endpoint, server: true
