#!/bin/bash

psql -U postgres -h db.fivetwentyseven.com -f create_deployment.sql -d broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2016 FROM STDIN WITH CSV HEADER DELIMITER ',' ENCODING 'LATIN1'" < "data/fbd_us_with_satellite_dec2016_v1.csv" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2014 FROM STDIN WITH CSV HEADER DELIMITER ',' ENCODING 'LATIN1'" < "data/fbd_us_with_satellite_dec2014_V2.csv" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2012 FROM STDIN WITH CSV HEADER DELIMITER '|' ENCODING 'LATIN1'" < "data/december_2012_random_pt_fixed.txt" broadband # Import census blocks larger than two square miles
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
	FROM STDIN WITH CSV HEADER DELIMITER '|' ENCODING 'LATIN1'" < "data/december_2012_census_block_fixed_2.txt" broadband # Import census blocks smaller than two square miles