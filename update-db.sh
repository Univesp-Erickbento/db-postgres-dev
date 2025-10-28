docker run --rm \
  --network bmt-rede-docker \
  -v "$(pwd)/../changelog":/liquibase/changelog \
  -v "$(pwd)/../sql":/liquibase/sql \
  liquibase-custom
