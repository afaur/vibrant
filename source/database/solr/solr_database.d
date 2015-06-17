module solr_database;

import base_std;
import base_initializer;

// Not Implemented Yet
// Using https://github.com/mdx-dev/consumer-solr/commit/3828565f3a2cfdc749fd672c21aefc74104a4760#diff-83c753e5771dce9dcf81087bce0ab8aaR1
// http://dlang.org/phobos/std_net_curl.html
void solr_conn()
{

  auto host         = "";
  auto port         = 8080;
  auto path         = "";
  auto core_name    = "test_core";

  auto solr_url     = "http://" ~ host ~ ":" ~ to!string(port) ~ path ~ "/" ~ core_name ~ "/";

  auto update_url   = solr_url ~ "update/json?commit=true";
  auto select_url   = solr_url ~ "select/";

  auto auto_commit = true;
  auto auto_commit_limit = 1000;

}

