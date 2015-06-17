module base_initializer;

import base_std;
import base_vibe;

string get_env()
{
    auto current_env = environment.get("WSERV_ENV");
    if (current_env is null)
    {
        current_env = "development";
    }
    return current_env;
}

HTTPServerSettings http_read()
{

  // Get server configuration from our toml file
  auto config   = parseFile("./config/settings.toml");

  // Read the values in the toml file
  auto ip       = config["webserver"]["ip"].str;
  auto port     = to!ushort(config["webserver"]["port"].integer);

  // Create a settings object for vibe.d
  auto settings = new HTTPServerSettings;

  // Use the toml settings for our server settings
  settings.port = port;
  settings.bindAddresses = ["::1", ip];

  return settings;

}

string pg_read()
{

  // Get server configuration from our toml file
  auto config     = parseFile("./config/postgres.toml");

  // Get the environment
  auto serv_env   = get_env();

  // Read the values in the toml file
  auto connstring = config[serv_env]["connstring"].str;

  return connstring;

}

string[string] mongo_read()
{

  // Get server configuration from our toml file
  auto config   = parseFile("./config/mongo.toml");

  // Get the environment
  auto serv_env   = get_env();

  // Read the values in the toml file
  auto host       = config[serv_env]["host"].str;
  auto db         = config[serv_env]["db"].str;

  auto settings = assocArray(
    [ tuple("host", host), tuple("db", db) ]
  );

  return settings;

}

string mysql_read()
{

  // Get server configuration from our toml file
  auto config     = parseFile("./config/mysql.toml");

  // Get the environment
  auto serv_env   = get_env();

  // Read the values in the toml file
  auto connstring = config[serv_env]["connstring"].str;

  return connstring;

}

string[string] cass_read()
{

  // Get server configuration from our toml file
  auto config     = parseFile("./config/cassandra.toml");

  // Get the environment
  auto serv_env   = get_env();

  // Read the values in the toml file
  auto host       = config[serv_env]["host"].str;
  auto port       = to!string(config[serv_env]["port"].integer);
  auto keyspace   = config[serv_env]["keyspace"].str;

  auto settings = assocArray(
    [ tuple("host", host), tuple("port", port), tuple("keyspace", keyspace) ]
  );

  return settings;

}

