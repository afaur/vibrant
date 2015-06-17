module postgres_database;

import base_std;
import base_initializer;

shared(AsyncPool) pg_conn()
{

  // Quering a server from pool
  // Initializing concurrent logger
  auto logger = new shared StrictLogger("./log/pglog.log");

  scope(exit) logger.finalize();

  // Intitializing PostgreSQL bindings and Connection factory
  auto api = new shared PostgreSQL(logger);
  auto connProvider = new shared PQConnProvider(logger, api);

  // Creating pool
  auto pool = new shared AsyncPool(logger, connProvider
    , dur!"seconds"(1) // time between reconnection tries
    , dur!"seconds"(5) // maximum time to wait for free connection appearing in the pool while quering
    , dur!"seconds"(3) // every 3 seconds check connection
  );
  scope(failure) pool.finalize();

  // Read postgres settings
  auto postgres_conn_string = base_initializer.pg_read();

  writeln("Postgres: " ~ postgres_conn_string);

  // Adding server to the pool
  pool.addServer(postgres_conn_string, 1);

  //auto bsonRange = pool.execTransaction(["select \"Hello, world!\"::text as test_field"]);

  // Almost there is one bson respond, but there could be more
  // if you put several commands in a transaction
  //foreach(bson; bsonRange) writeln(bson);

  return pool;

}

