module mysql_database;

import base_std;
import base_initializer;

Connection mysql_conn()
{

  // Read mysql settings
  auto mysql_conn_string = base_initializer.mysql_read();

  writeln("MySQL: " ~ mysql_conn_string);

  auto c = testMySql(mysql_conn_string);

  return c;

}

Connection testMySql(string connStr)
{

  version(UseConnPool) {

    import mysql.db;
    auto mdb = new MysqlDB(connStr);
    auto c = mdb.lockConnection();
    scope(exit) c.close();

  } else {

    auto c = new Connection(connStr);
    scope(exit) c.close();

  }

  MetaData md = MetaData(c);
  auto dbList = md.databases();

  writefln("Found %s databases", dbList.length);

  foreach ( db; dbList ) {

    c.selectDB(db);
    auto curTables = md.tables();

    writefln("Database '%s' has %s table%s.", db, curTables.length, curTables.length == 1?"":"s");

    foreach (tbls ; curTables) {
        writefln("\t%s", tbls);
    }

  }

  return c;

}
