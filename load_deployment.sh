#!/bin/bash

# Remove problematic lines from 2012 text files


psql -U postgres -h db.fivetwentyseven.com -f create.sql -d broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2016 FROM STDIN WITH CSV HEADER DELIMITER ',' ENCODING 'UTF-8'" < "data/fbd_us_with_satellite_dec2016_v1.csv" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2014 FROM STDIN WITH CSV HEADER DELIMITER ',' ENCODING 'UTF-8'" < "data/fbd_us_with_satellite_dec2014_V2.csv" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2012 FROM STDIN WITH CSV HEADER DELIMITER '|' ENCODING 'UTF-8'" < "data/December-2012-Random_pt.txt" broadband # Import census blocks larger than two square miles
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2012 (
	objectid,
	frn,
	provname,
	dbaname,
	hoconum,
	hoconame,
	stateabbr,
	fullfipsid,
	transtech,
	maxaddown,
	maxadup,
	typicdown,
	typicup,
	downloadspeed,
	uploadspeed,
	provider_type,
	end_user_cat
	)
	FROM STDIN WITH CSV HEADER DELIMITER '|' ENCODING 'UTF-8'" < "data/December-2012-Census_Block.txt" broadband # Import census blocks smaller than two square miles