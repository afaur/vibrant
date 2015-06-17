module cassandra_database;

import base_std;
import base_initializer;

// Not Implemented Yet
void cass_conn()
{

  // Read cassandra settings
  auto cassandra_settings = base_initializer.cass_read();

  writeln(
    "Cassandra - Host: " ~ cassandra_settings["host"] ~
    " Port: "            ~ cassandra_settings["port"] ~
    " Keyspace: "        ~ cassandra_settings["keyspace"]
  );

  //auto cassandra = connectCassandraDB(
  //  cassandra_settings["host"],
  //  to!ushort(cassandra_settings["port"]),
  //  cassandra_settings["keyspace"]
  //);

  //CassandraKeyspace ks;

  //try ks = cassandra.getKeyspace(keyspace);
  //catch (Exception e) ks = cassandra.createKeyspace(keyspace);

}
