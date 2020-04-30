
#!/usr/bin/env bash
docker build -t postgresql-metadata-generator .
docker tag postgresql-metadata-generator mesmacosta/postgresql-metadata-generator:stable
docker push mesmacosta/postgresql-metadata-generator:stable
