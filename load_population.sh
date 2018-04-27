#!/bin/bash

psql -U postgres -h db.fivetwentyseven.com -f create_population.sql -d broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY population FROM STDIN WITH CSV HEADER DELIMITER ',' ENCODING 'LATIN1'" < "data/nhgis0005_ds172_2010_block.csv" broadband