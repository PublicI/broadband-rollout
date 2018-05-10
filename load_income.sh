#!/bin/bash

psql -U postgres -h db.fivetwentyseven.com -f create_income.sql -d broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY income FROM STDIN WITH CSV HEADER DELIMITER ',' ENCODING 'LATIN1'" < "data/nhgis0007_ds225_20165_2016_blck_grp.csv" broadband