#!/bin/sh


# neo4j container
echo "Starting neo4j container..."

set -x #echo on


# re-start with default database
docker run \
	-u `id -u $USER` \
	--publish=7473:7473 \
	--publish=7474:7474 \
	--publish=7687:7687 \
	--rm \
	--volume=/home/areias/Documents/kineviz/dreams/data:/data \
	--volume=/home/areias/Documents/kineviz/dreams/plugins:/plugins \
    --volume=/home/areias/Documents/kineviz/dreams/import:/var/lib/neo4j/import  \
    --volume=/home/areias/Documents/kineviz/dreams/code:/code \
	--env NEO4J_AUTH=neo4j/test \
    -e NEO4J_apoc_export_file_enabled=true \
    -e NEO4J_apoc_import_file_enabled=true \
    -e NEO4J_apoc_import_file_use__neo4j__config=true \
    -e NEO4JLABS_PLUGINS='["apoc", "graph-data-science"]' \
	--name neo4j \
	  neo4j \


