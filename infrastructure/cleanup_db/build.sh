
#!/usr/bin/env bash
docker build -t postgresql-db-cleaner .
docker tag postgresql-db-cleaner mesmacosta/postgresql-db-cleaner:stable
docker push mesmacosta/postgresql-db-cleaner:stable
