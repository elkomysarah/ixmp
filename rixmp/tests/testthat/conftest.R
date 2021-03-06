.test_mp_count <- 0

test_mp <- function () {
  # An ixmp.Platform connected to a temporary, local database.
  #
  # This function mirrors the pytest fixture of the same name, defined in
  # tests/conftest.py.

  # Path for the test database
  db_path <- file.path(Sys.getenv('IXMP_TEST_TMP_PATH'), .test_mp_count)
  .test_mp_count <<- .test_mp_count + 1

  # Path containing the files to populate the database
  db_data_path <- file.path(Sys.getenv('IXMP_TEST_DATA_PATH'), 'testdb')

  # Create the database
  test_props <- ixmp$testing$create_local_testdb(db_path, db_data_path)

  # launch Platform and connect to testdb (reconnect if closed)
  mp <- ixmp$Platform(test_props)
  mp$open_db()

  return(mp)
}
