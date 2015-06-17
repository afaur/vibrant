module mongo_database;

import base_std;
import base_vibe;
import base_initializer;

MongoClient mongo_conn()
{

  MongoClient client;

  // Read postgres settings
  auto mongo_settings = base_initializer.mongo_read();

  writeln(
    "Mongo - Host: " ~ mongo_settings["host"] ~
    " Port: " ~ to!string(mongo_settings["port"]) ~
    " DB: " ~ mongo_settings["db"]
  );

  client = connectMongoDB(mongo_settings["host"]);

  //auto coll = client.getCollection("test.collection");

  //foreach ( doc; coll.find(["name": "test"]) )
    //logInfo( "Found entry: %s", doc.toJson() );

  return client;

}

