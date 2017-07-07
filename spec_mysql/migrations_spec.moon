import setup_db, teardown_db from require "spec_mysql.helpers"

import drop_tables from require "kong-lapis.spec.db"

describe "model", ->
  setup ->
    setup_db!

  teardown ->
    teardown_db!

  before_each ->
    import LapisMigrations from require "kong-lapis.db.migrations"
    drop_tables LapisMigrations\table_name!

  it "should run blank migrations", ->
    migrations = require "kong-lapis.db.migrations"
    migrations.run_migrations {}

  it "should run some migrations", ->
    migrations = require "kong-lapis.db.migrations"
    migrations.run_migrations {
      =>
        print "hello world"
    }

