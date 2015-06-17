module user_controller;

import std.stdio;

import vibe.d;
import vibe.core.args;
import vibe.appmain;
import vibe.http.server;

import base_database;

void user_show(HTTPServerRequest req, HTTPServerResponse res)
{
  //auto username = req.params["user"];
  //auto mclient = base_database.mongo_conn();
  //auto pclient = base_database.pg_conn();
  //auto myclient = base_database.mysql_conn();
  //auto cclient = base_database.cass_conn();
  //render!("index.dt", username)(res);
  render!("index.dt")(res);
}

void user_add(HTTPServerRequest req, HTTPServerResponse res)
{
  enforceHTTP("user" in req.form, HTTPStatus.badRequest, "Missing user field.");
  auto mclient = mongo_database.mongo_conn();
  res.redirect("/users/"~req.form["user"]);
}

